import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchBarHint extends StatelessWidget {
  const SearchBarHint({super.key , required this.color,});
  final ValueNotifier<Color> color;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: color,
      builder: (context, value, child) {
        return SliverAppBar(
            backgroundColor: value,
            elevation: 0,
            pinned: true,
            titleSpacing: 0,
            title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child:Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.white70),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).searchHint,
                          style: TextStyle(
                            color: Colors.white70.withValues(alpha: 0.7),
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
            )
        );
      },
    );

  }
}
