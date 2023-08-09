import 'package:flutter/material.dart';

class ContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 10 * 6, radius = 20;

    Path path3 = Path();
    double width = size.width - 20, height = size.height - 10;
    double startX = 20, startY = 10;

    path3.moveTo(centerX - radius, startY);
    path3.quadraticBezierTo(centerX - radius / 2 - 9, startY + radius, centerX, startY + radius);
    path3.quadraticBezierTo(centerX + radius / 2 + 9, startY + radius, centerX + radius, startY);
    // path3.arcTo(oval, startAngle, sweepAngle, false);
    // path3.arcToPoint(Offset(centerX + radius, startY), radius: Radius.circular(radius));
    path3.lineTo(width - 20, startY);
    path3.quadraticBezierTo(width, startY, width, startY + 20);
    path3.lineTo(width, height - 20);
    path3.quadraticBezierTo(width, height, width - 20, height);
    path3.lineTo(centerX + radius, height);
    // path3.arcTo(oval2, startAngle2, sweepAngle2, false);
    path3.quadraticBezierTo(centerX + radius / 2 + 9, height - radius, centerX, height - radius);
    path3.quadraticBezierTo(centerX - radius / 2 - 9, height - radius, centerX - radius, height);
    // path3.moveTo(centerX - radius, height);
    path3.lineTo(startX + 20, height);
    path3.quadraticBezierTo(startX, height, startX, height - 20);
    path3.lineTo(startX, startY + 20);
    path3.quadraticBezierTo(startX, startY, startX + 20, startY);
    path3.lineTo(centerX - radius, startY);
    path3.close();

    // paint3.shader = const RadialGradient(
    //   colors: [Colors.black, Colors.grey],
    //   radius:0.0,
    //   center: Alignment.bottomCenter,
    // ).createShader(Rect.fromCircle(center: Offset(centerX, height / 2), radius: radius));
    Path path = Path();

    path.moveTo(width, height - 50);
    // path.quadraticBezierTo(width, startY, width, 20);
    path.lineTo(width, height - 20);
    path.quadraticBezierTo(width, height, width - 20, height);
    path.lineTo(centerX + radius, height);
    // path3.arcTo(oval2, startAngle2, sweepAngle2, false);
    path.quadraticBezierTo(centerX + radius / 2 + 9, height - radius, centerX, height - radius);
    path.quadraticBezierTo(centerX - radius / 2 - 9, height - radius, centerX - radius, height);
    // path3.moveTo(centerX - radius, height);
    path.lineTo(startX + 20, height);
    path.quadraticBezierTo(startX, height, startX, height - 20);
    path.lineTo(startX, height - 50);
    path.close();

    Paint paint = Paint();
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.fill;
    paint.color = Colors.grey;

    paint.maskFilter = const MaskFilter.blur(BlurStyle.outer, 9);

    Paint paint3 = Paint();
    paint3.strokeWidth = 1;
    paint3.style = PaintingStyle.fill;
    paint3.color = Colors.grey.withOpacity(0.5);
    // add shadow
    paint3.maskFilter = const MaskFilter.blur(BlurStyle.outer, 5);

    Paint paint4 = Paint();
    paint4.strokeWidth = 1;
    paint4.style = PaintingStyle.fill;
    paint4.color = Colors.white;

    canvas.drawPath(path, paint);
    canvas.drawPath(path3, paint3);
    canvas.drawPath(path3, paint4);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
