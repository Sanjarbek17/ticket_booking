import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_markdown_editor/simple_markdown_editor.dart';

import '../../../../core/utils/date_time_func.dart';
import '../../data/models/event_model.dart';
import '../event_bloc/event_bloc.dart';
import '../widgets/custom_textfield.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController placeOfEventController = TextEditingController();
  TextEditingController numberOfSeatsController = TextEditingController(text: '0');
  TextEditingController priceController = TextEditingController(text: '0.00');

  String selectedTopic = 'Information Technologies';
  String selectedCurrency = 'UZS';
  DateTime? dateTime = DateTime.now();
  File? file;
  EventModel eventModel = EventModel(
    name: '',
    description: '',
    topic: '',
    date: DateTime.now(),
    place: '',
    numberOfSeats: 0,
    ticketPrice: '',
    currency: Currency.UZS,
    thumbnail: '',
  );

  EventModel createEvent() {
    eventModel = EventModel(
      name: nameController.text,
      description: descriptionController.text,
      topic: selectedTopic,
      date: dateTime!,
      place: placeOfEventController.text,
      numberOfSeats: int.parse(numberOfSeatsController.text),
      ticketPrice: priceController.text,
      currency: currencyMapReverse[selectedCurrency]!,
      thumbnail: file!.path,
    );

    context.read<EventBloc>().add(CreateEventEvent(eventModel));
    // try {
    //   sl<EventRepository>().createEvent(eventModel);
    // } catch (e) {
    //   showModalBottomSheet(context: context, builder: (context) => Text('Error: $e'));
    // }
    return eventModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: createEvent,
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    CustomTextField(text: 'Name', controller: nameController),
                    const SizedBox(height: 20),
                    // const Text('Description', style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFD5D5D5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MarkdownFormField(
                          controller: descriptionController,
                          enableToolBar: true,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Topic', style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                              DropdownButton(
                                value: selectedTopic,
                                items: const [
                                  DropdownMenuItem(value: 'Information Technologies', child: Text('Information Technologies')),
                                  DropdownMenuItem(value: 'Science', child: Text('Science')),
                                  DropdownMenuItem(value: 'Biology', child: Text('Biology')),
                                  DropdownMenuItem(value: 'Bussiness', child: Text('Bussiness')),
                                  DropdownMenuItem(value: 'Marketing', child: Text('Marketing')),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedTopic = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('DateTime', style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                              SizedBox(width: 140, child: Text(dateTime == null ? 'No date selected' : dateTime.toString(), overflow: TextOverflow.ellipsis)),
                              ElevatedButton(
                                onPressed: () async {
                                  dateTime = await showDateTimePicker(context: context);
                                  setState(() {});
                                },
                                child: const Text('Select Date'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('ImagePath', style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                              SizedBox(width: 140, child: Text(file == null ? 'No file selected' : file!.path.split('/').last, overflow: TextOverflow.ellipsis)),
                              ElevatedButton(
                                onPressed: () async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    file = File(result.files.single.path!);
                                    setState(() {});
                                  } else {
                                    // User canceled the picker
                                    return;
                                  }
                                },
                                child: const Text('Select Image'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(text: 'Place of Event', controller: placeOfEventController),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Text('Number of Seats', style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                              const Spacer(),
                              Expanded(child: CustomTextField(textInputType: TextInputType.number, controller: numberOfSeatsController)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Text('Price name', style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                              const SizedBox(width: 20),
                              DropdownButton(
                                value: selectedCurrency,
                                items: const [
                                  DropdownMenuItem(value: 'USD', child: Text('USD')),
                                  DropdownMenuItem(value: 'UZS', child: Text('UZS')),
                                  DropdownMenuItem(value: 'PLN', child: Text('PLN')),
                                  DropdownMenuItem(value: 'RUB', child: Text('RUB')),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedCurrency = value.toString();
                                  });
                                },
                              ),
                              const SizedBox(width: 20),
                              Expanded(child: CustomTextField(textInputType: TextInputType.number, controller: priceController)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if (state is EventLoadingState) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else if (state is EventErrorState) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.message, style: const TextStyle(color: Colors.white)),
                      ElevatedButton(
                        onPressed: () => context.read<EventBloc>().add(InitialEventEvent()),
                        child: const Text('Retry'),
                      ),
                    ],
                  )),
                );
              } else if (state is EventCreatedState) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Event created', style: TextStyle(color: Colors.white)),
                        ElevatedButton(
                          onPressed: () => context.read<EventBloc>().add(InitialEventEvent()),
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
