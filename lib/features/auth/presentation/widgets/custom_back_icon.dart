import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackIcon extends StatelessWidget {
  const CustomBackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/angle-left.svg', width: 27, height: 27),
            const SizedBox(width: 10),
            const Text('Back', style: TextStyle(color: Color(0xFF414141), fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
