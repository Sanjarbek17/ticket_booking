import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  const CustomListTile({
    super.key,
    this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFFFBC4F), size: 30),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Color(0xFF455A64), fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
            SizedBox(width: 120, child: Text(subtitle, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFFAAA4BE), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500))),
          ],
        ),
      ],
    );
  }
}
