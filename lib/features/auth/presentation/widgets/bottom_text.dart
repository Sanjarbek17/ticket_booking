import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  const BottomText({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: const TextStyle(color: Color(0xFF5A5A5A), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText, style: const TextStyle(color: Color(0xFFEDAE10), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
