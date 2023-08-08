import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final TextInputType? textInputType;
  const CustomTextField({
    super.key,
    this.text,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: Color(0xFFD0D0D0), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD0D0D0), width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD0D0D0), width: 1.0),
        ),
      ),
    );
  }
}
