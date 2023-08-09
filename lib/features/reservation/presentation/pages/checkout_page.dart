import 'package:flutter/material.dart';

import '../widgets/price_widget.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Reservation'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                shadows: const [BoxShadow(color: Color(0x05000000), blurRadius: 8, offset: Offset(0, 1), spreadRadius: 0)],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset('assets/images/first.png', fit: BoxFit.contain)),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pantai Dreamland', style: TextStyle(color: Color(0xFF161618), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                        SizedBox(height: 8),
                        Text('Jl. Lorem Ipsum Dolor Sit Amet Bandung No. 123', style: TextStyle(color: Color(0xFF161618), fontSize: 10, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.all(14),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 148,
                    height: 40,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(side: const BorderSide(width: 0.70, color: Color(0xFFFFBC4F)), borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Fri, 7 Jan 2022', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFFFBC4F), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500, letterSpacing: -0.24, height: 1.67)),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 120,
                    height: 40,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.70, color: Color(0xFFFFBC4F)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('15.00 UTC', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFFFBC4F), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500, height: 1.67, letterSpacing: -0.24)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.all(14),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Guest', style: TextStyle(color: Color(0xFF161618), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.remove, color: Color(0xFF161618), size: 22),
                      SizedBox(width: 10),
                      Text('2', style: TextStyle(color: Color(0xFF161618), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      SizedBox(width: 10),
                      Icon(Icons.add, color: Color(0xFF161618), size: 22),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Summary', style: TextStyle(color: Color(0xFF161618), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  PriceWidget(title: 'One Ticket Price', price: 'Rp. 1.000.000', fontSize: 12),
                  SizedBox(height: 20),
                  PriceWidget(title: 'Total Payment', price: 'Rp. 1.000.000', fontSize: 14),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              child: const Text('Buy Ticket', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
