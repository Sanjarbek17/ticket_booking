import 'package:flutter/material.dart';

class CustomListBuilder extends StatelessWidget {
  final VoidCallback? onTap;
  const CustomListBuilder({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => CustomCard(onTap: onTap),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final VoidCallback? onTap;
  const CustomCard({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('assets/images/first.png'),
            ),
            const SizedBox(width: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Makena Beach', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFF161618), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                  SizedBox(height: 5.0),
                  Text('Jl. Lorem Ipsum Dolor Sit Amet Bandung No.', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFF161618), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const Spacer(),
            const Column(
              children: [
                Icon(Icons.bookmark, color: Color(0xFF161618), size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
