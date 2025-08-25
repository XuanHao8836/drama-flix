
import 'dart:convert';

import 'package:drama_flix/app/provider/locale_provider.dart';
import 'package:drama_flix/common/widgets/custom_app_bar.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _selectedLocale = 'en';
  Future<Map<String, String>>? _languagesFuture;

  @override
  void initState() {
    super.initState();
    _languagesFuture = _loadLanguages();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final localeProvider = Provider.of<LocaleProvider>(
        context,
        listen: false,
      );
      setState(() {
        _selectedLocale = localeProvider.locale.languageCode;
      });
    });
  }

  Future<Map<String, String>> _loadLanguages() async {
    final String response = await rootBundle.loadString(
      'assets/language/languages.json',
    );
    final data = json.decode(response) as Map<String, dynamic>;
    return Map<String, String>.from(data['language']['name']);
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).language,
        onActionPressed: () {
          localeProvider.setLocale(Locale(_selectedLocale));
          if (!context.mounted) return;
          Navigator.pop(context);
        },
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _languagesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.hasData && snapshot.data != null) {
            final languages = snapshot.data!;
            final locales = languages.keys.toList();

            return ListView.builder(
              padding: const EdgeInsets.only(left: 16),
              itemCount: locales.length,
              itemBuilder: (context, index) {
                final localeKey = locales[index];
                final languageName = languages[localeKey];
                final currentLanguageCode = localeKey.split('_')[0];
                return ListTile(
                  title: Text(
                    languageName ?? '',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  trailing: _selectedLocale == currentLanguageCode
                      ? const Icon(Icons.check, color: Colors.pink)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedLocale = currentLanguageCode;
                    });
                  },
                );
              },
            );
          }
          return Center(
            child: Text(
              AppLocalizations.of(context).nodatafound,
            ),
          );
        },
      ),
    );
  }
}
