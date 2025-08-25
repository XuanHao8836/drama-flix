import 'package:flutter/material.dart';

Future<void> showCommonDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String positiveText,
  required VoidCallback onPositive,
  required String negativeText,
}) {
  return showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: Text(negativeText),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              onPositive();
            },
            child: Text(positiveText),
          ),
        ],
      );
    },
  );
}
