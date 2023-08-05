import 'package:flutter/material.dart';

class YellowButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const YellowButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFEDAE10)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(const Size(260, 50)),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 17, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
    );
  }
}
