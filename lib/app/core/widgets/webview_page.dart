import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;
  var loadingPercentage = 0;
  bool isError = false;


  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    final uri = Uri.tryParse(widget.url);

    if (uri == null || !uri.hasScheme) {
      setState(() {
        isError = true;
      });
      controller = WebViewController();
      return;
    }

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
              isError = false;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },

          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (error) {
            setState(() {
              isError = true;
            });
            debugPrint('Web resource error: ${error.description}');
          },
        ),
      )
      ..loadRequest(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          if (!isError)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                controller.reload();
              },
            ),
        ],
      ),
      body: isError
          ?  Center(
              child: Text(
                AppLocalizations.of(context)?.anErrorHasOccurred ?? 'An error has occurred',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )
          : Stack(
              children: [
                WebViewWidget(controller: controller),
                if (loadingPercentage < 100)
                  LinearProgressIndicator(
                    value: loadingPercentage / 100.0,
                    color: Colors.blue,
                    backgroundColor: Colors.grey[200],
                  ),
              ],
            ),
    );
  }
}
