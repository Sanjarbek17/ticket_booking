import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/core/paints/container_painter.dart';

import '../../../../core/paints/dashed_line_painter.dart';
import '../../../../core/routes/route.dart';
import '../../../events/data/models/event_model.dart';
import '../bloc/reservation_bloc.dart';
import 'custom_list_tile.dart';

class CustomResvBuilder extends StatelessWidget {
  const CustomResvBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
      builder: (context, state) {
        if (state is ReservationInitial) {
          BlocProvider.of<ReservationBloc>(context).add(GetReservationListEvent());
        }
        if (state is ReservationLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ReservationError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        if (state is ReservationLoaded) {
          final events = state.reservations;
          return Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) => CustomCard(eventModel: events[index]),
            ),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => const CustomCard(),
          ),
        );
      },
    );
  }
}

class CustomCard extends StatelessWidget {
  final EventModel? eventModel;
  const CustomCard({
    super.key,
    this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(AppRouter.reservationFuncCheckRoute(0));
      },
      child: CustomPaint(
        painter: ContainerPainter(),
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            // color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: CustomPaint(
            painter: DashedLinePainter(),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(eventModel?.name ?? 'Unknown', style: const TextStyle(color: Color(0xFF161618), fontSize: 17.71, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      CustomListTile(
                        icon: Icons.telegram,
                        title: 'Date',
                        subtitle: DateFormat('dd.MM.yyyy').format(eventModel?.date ?? DateTime.now()),
                      ),
                      CustomListTile(
                        icon: Icons.location_on,
                        title: eventModel?.place ?? 'Unknown',
                        subtitle: eventModel?.description ?? 'Unknown',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(DateFormat('HH:mm').format(eventModel?.date ?? DateTime.now()), style: const TextStyle(color: Color(0xFF161618), fontSize: 17.71, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Buy Ticket', style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 12.79, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          text: 'Price: ',
                          style: const TextStyle(color: Color(0xFF161618), fontSize: 12.79, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(text: NumberFormat().simpleCurrencySymbol(currencyMap[eventModel!.currency]!), style: const TextStyle(color: Color(0xFFD84130), fontSize: 13.77, fontFamily: 'Roboto', fontWeight: FontWeight.w500)),
                            const TextSpan(text: '100 000', style: TextStyle(color: Color(0xFFD84130), fontSize: 13.77, fontFamily: 'Roboto', fontWeight: FontWeight.w500)),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
