import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/core/routes/route.dart';

import '../event_bloc/event_bloc.dart';

class DetailsPage extends StatelessWidget {
  final int id;
  const DetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        if (state is EventLoadedState) {
          if (state.event == null) {
            context.read<EventBloc>().add(GetEventByIdEvent(id));
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            decoration: const BoxDecoration(color: Colors.white, image: DecorationImage(image: AssetImage('assets/images/first.png'), alignment: Alignment.topCenter, fit: BoxFit.fitWidth)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(state.event?.name ?? 'Unknown', style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.white),
                              Text(state.event?.place ?? 'Nowhere', style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text('Description', style: TextStyle(color: Color(0xFF161618), fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Markdown(
                              data: state.event?.description ?? 'No description',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BottomText(text: 'Price', price: state.event?.ticketPrice.toString() ?? '0.0', currency: '/person'),
                              BottomText(text: 'Seats', price: '0', currency: '/${state.event?.numberOfSeats ?? '0'}'),
                              BottomText(text: 'Date', price: DateFormat('dd.MM.yyyy').format(state.event?.date ?? DateTime.now())),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.go(AppRouter.reservationCheckRoute, extra: state.event);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('BOOK NOW', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (state is EventErrorState) {
          return const Text('Error');
        } else {
          return const Text('Error');
        }
      },
    );
  }
}

class BottomText extends StatelessWidget {
  final String text;
  final String? price;
  final String? currency;

  const BottomText({
    super.key,
    required this.text,
    this.price,
    this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: const TextStyle(color: Color(0xFFB5B5B5), fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.w600)),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: price, style: const TextStyle(color: Color(0xFFFF9900), fontSize: 14, fontFamily: 'Lato', fontWeight: FontWeight.w700)),
              TextSpan(text: currency, style: const TextStyle(color: Color(0xFFB5B5B5), fontSize: 14, fontFamily: 'Lato', fontWeight: FontWeight.w700)),
            ],
          ),
        )
      ],
    );
  }
}
