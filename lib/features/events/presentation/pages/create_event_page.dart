import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:simple_markdown_editor/simple_markdown_editor.dart';

import '../../../../core/utils/date_time_func.dart';
import '../widgets/custom_textfield.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  TextEditingController descriptionController = TextEditingController();

  String selectedItem = 'Information Technologies';
  String selectedCurrency = 'UZS';
  DateTime? dateTime = DateTime.now();
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Event', style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const CustomTextField(text: 'Name'),
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
                        emojiConvert: true,
                        autoCloseAfterSelectEmoji: false,
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
                              value: selectedItem,
                              items: const [
                                DropdownMenuItem(value: 'Information Technologies', child: Text('Information Technologies')),
                                DropdownMenuItem(value: 'Science', child: Text('Science')),
                                DropdownMenuItem(value: 'Biology', child: Text('Biology')),
                                DropdownMenuItem(value: 'Bussiness', child: Text('Bussiness')),
                                DropdownMenuItem(value: 'Marketing', child: Text('Marketing')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedItem = value.toString();
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
                            Text(dateTime == null ? 'No date selected' : dateTime.toString()),
                            ElevatedButton(
                              onPressed: () async {
                                dateTime = await showDateTimePicker(context: context);
                                setState(() {});
                              },
                              child: const Text('Select Date'),
                            ),
                          ],
                        ),
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
                        const CustomTextField(text: 'Place'),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Text('Number of Seats', style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                            Spacer(),
                            Expanded(child: CustomTextField(textInputType: TextInputType.number)),
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
                            const Expanded(child: CustomTextField(textInputType: TextInputType.number)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
