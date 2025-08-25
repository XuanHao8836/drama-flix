import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    },
  );
}

// Hàm đóng dialog loading
void hideLoadingDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}