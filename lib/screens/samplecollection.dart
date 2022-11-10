import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:forms/screens/specialcare.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../widget/formdetails.dart';

class SampleCollectionForm extends StatefulWidget {
  const SampleCollectionForm({super.key});

  @override
  State<SampleCollectionForm> createState() => _SampleCollectionFormState();
}

class _SampleCollectionFormState extends State<SampleCollectionForm> {
  String? radiooptions;

  bool _buttonColor = true;
  bool _button2Color = true;
  bool _buttonName = true;

  String userName = "Alexander";

  String mobileNumber = "9875580991";

  String gender = "Male/Female";

  String permanentLocation = "Beckenham";

  String healthCardNumber = "000 1111 2222 3333";

  String serviceRequired = "Name of the Service";

  pickLabTestData(bool isCamera) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      labTestList.add(pickedImage!);
    });
  }

  pickReportListData(bool isCamera) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      medicalreportList.add(pickedImage!);
    });
  }

  List labTestList = [];
  List medicalreportList = [];

  bool patientloanValue = false,
      biopsySample = false,
      covidTest = false,
      dnaSample = false;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2023, 12));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectedTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedTime = picked as TimeOfDay?;
      });
    }
  }

  String testNameDropDownValue = 'Item 1';
  var itemsName = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String testPackageDropDownValue = 'Item 1';
  var itemsPackage = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Sample Collection")),
      ),
      body: ListView(
        children: [
          BorderedCard(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Name",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(userName,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Phone. No",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(mobileNumber,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Gender",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(gender,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Location",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(permanentLocation,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Health Card No.",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(healthCardNumber,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Service required",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(serviceRequired,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          BorderedCard(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text("Alternate No",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: TextFormField(
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Description",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text("Pincode",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: TextFormField(
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Description",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text("Address",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: TextFormField(
                            minLines: 2,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: "Description",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text("Description about working place",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: TextFormField(
                            minLines: 2,
                            maxLines: 8,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: "Description",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          BorderedCard(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Test Name",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      value: testNameDropDownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: itemsName.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          testNameDropDownValue = newValue!;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Test Package",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      value: testPackageDropDownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: itemsPackage.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          testPackageDropDownValue = newValue!;
                        });
                      },
                    )
                  ],
                )

              ],
            ),
          )),
          BorderedCard(
            child: Column(
              children: [
                CheckboxListTile(
                  title: const Text("Covid test"),
                  value: covidTest,
                  onChanged: (bool? value) {
                    setState(() {
                      covidTest = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("DNA Sample collection"),
                  value: dnaSample,
                  onChanged: (bool? value) {
                    setState(() {
                      dnaSample = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Biopsy sample collection"),
                  value: biopsySample,
                  onChanged: (bool? value) {
                    setState(() {
                      biopsySample = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          Divider(),
          BorderedCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text(
                          selectedDate == null
                              ? "Date"
                              : DateFormat.yMd().format(selectedDate!),
                          style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
                Text(":"),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        _selectedTime(context);
                      },
                      child: Text(
                          selectedTime == null
                              ? "Time"
                              : TimeOfDay.now().format(context),
                          style: TextStyle(fontSize: 20)),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(0, 153, 204, 1),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Book"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
