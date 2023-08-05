import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TripleBoxIcon extends StatelessWidget {
  const TripleBoxIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ItemBox(path: 'assets/icons/gmail.svg'),
        SizedBox(width: 10),
        ItemBox(path: 'assets/icons/Facebook.svg'),
        SizedBox(width: 10),
        ItemBox(path: 'assets/icons/Apple.svg'),
      ],
    );
  }
}

class ItemBox extends StatelessWidget {
  final String path;
  const ItemBox({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.75, color: Color(0xFFD0D0D0)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SvgPicture.asset(path),
    );
  }
}
