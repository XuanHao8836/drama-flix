import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  final String iconAsset;
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;

  const SocialLoginButton({
    super.key,
    required this.iconAsset,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SvgPicture.asset(iconAsset, height: 24, width: 24),
              ),
            ),
            Text(text, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
