import 'package:flutter/material.dart';

class ColorTopic extends StatefulWidget {
  final String text;
  final bool isColor;
  const ColorTopic({
    super.key,
    required this.text,
    this.isColor = false,
  });

  @override
  State<ColorTopic> createState() => _ColorTopicState();
}

class _ColorTopicState extends State<ColorTopic> {
  bool isColor = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: InkWell(
        onTap: () => setState(() => isColor = !isColor),
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: 66,
          height: 24,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.70, color: (widget.isColor || isColor) ? const Color(0xFFFFBC4F) : const Color(0x4B0E0E0F)),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Text(widget.text, textAlign: TextAlign.center, style: TextStyle(color: (widget.isColor || isColor) ? const Color(0xFFFFBC4F) : const Color(0x4B0E0E0F), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500, height: 1.67, letterSpacing: -0.24)),
        ),
      ),
    );
  }
}
