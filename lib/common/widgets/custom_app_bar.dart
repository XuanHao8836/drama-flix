import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onActionPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onActionPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      actions: [
        if(onActionPressed != null)
          TextButton(
            onPressed: () {
              onActionPressed?.call();
            },
            child:  Text(
             AppLocalizations.of(context)?.appbarAction ?? 'Done',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}