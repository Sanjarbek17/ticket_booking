import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/features/events/data/models/event_model.dart';
import 'package:ticket_booking/features/reservation/data/models/reservation_model.dart';
import 'package:ticket_booking/features/reservation/presentation/bloc/reservation_bloc.dart';

import '../widgets/price_widget.dart';

class CheckOutPage extends StatefulWidget {
  final EventModel eventModel;
  const CheckOutPage({super.key, required this.eventModel});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Reservation'),
      ),
      body: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          if (state is ReservationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReservationError) {
            return Center(child: Text(state.message));
          } else if (state is ReservationAccepted) {
            return const Center(child: Text('Reservation Accepted'));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    shadows: const [BoxShadow(color: Color(0x05000000), blurRadius: 8, offset: Offset(0, 1), spreadRadius: 0)],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.network(widget.eventModel.thumbnail, fit: BoxFit.contain)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.eventModel.name, style: const TextStyle(color: Color(0xFF161618), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            Text(widget.eventModel.description, style: const TextStyle(color: Color(0xFF161618), fontSize: 10, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
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
                  decoration: ShapeDecoration(color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 148,
                        height: 40,
                        decoration: ShapeDecoration(shape: RoundedRectangleBorder(side: const BorderSide(width: 0.70, color: Color(0xFFFFBC4F)), borderRadius: BorderRadius.circular(8))),
                        child: Text(DateFormat('E, d MMM y').format(widget.eventModel.date), textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFFFBC4F), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500, letterSpacing: -0.24, height: 1.67)),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 120,
                        height: 40,
                        decoration: ShapeDecoration(shape: RoundedRectangleBorder(side: const BorderSide(width: 0.70, color: Color(0xFFFFBC4F)), borderRadius: BorderRadius.circular(8))),
                        child: Text(DateFormat('H.mm UTC').format(widget.eventModel.date), textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFFFBC4F), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500, height: 1.67, letterSpacing: -0.24)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(14),
                  decoration: ShapeDecoration(color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Guest', style: TextStyle(color: Color(0xFF161618), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                if (count > 1) {
                                  setState(() {
                                    count--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove, color: Color(0xFF161618), size: 22)),
                          const SizedBox(width: 10),
                          Text(count.toString(), style: const TextStyle(color: Color(0xFF161618), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                          const SizedBox(width: 10),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  count++;
                                });
                              },
                              icon: const Icon(Icons.add, color: Color(0xFF161618), size: 22)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: ShapeDecoration(color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Payment Summary', style: TextStyle(color: Color(0xFF161618), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      PriceWidget(title: 'One Ticket Price', price: widget.eventModel.ticketPrice, fontSize: 12),
                      const SizedBox(height: 20),
                      PriceWidget(title: 'Total Payment', price: (double.parse(widget.eventModel.ticketPrice) * count).toString(), fontSize: 14),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    context.read<ReservationBloc>().add(CreateReservationEvent(ReservationModel(eventId: widget.eventModel.id!, numberOfTickets: count)));
                  },
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), padding: const EdgeInsets.symmetric(vertical: 20)),
                  child: const Text('Buy Ticket', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
