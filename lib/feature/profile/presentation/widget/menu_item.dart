import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF28282D),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailingText case final text?)
              Text(text, style: const TextStyle(color: Colors.grey)),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
