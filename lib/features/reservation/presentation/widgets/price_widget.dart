
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final String title;
  final String price;
  final double fontSize;
  const PriceWidget({
    super.key,
    required this.title,
    required this.price,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: const Color(0xFF161618), fontSize: fontSize, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
        Text(price, style: const TextStyle(color: Color(0x84161618), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
      ],
    );
  }
}
