
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 9, child: Divider()),
        Expanded(
          flex: 2,
          child: Text('or', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB8B8B8), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
        ),
        Expanded(flex: 9, child: Divider()),
      ],
    );
  }
}