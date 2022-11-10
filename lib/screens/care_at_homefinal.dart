import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:forms/screens/specialcare.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../widget/formdetails.dart';

class CareAtHomeForm extends StatefulWidget {
  const CareAtHomeForm({super.key});

  @override
  State<CareAtHomeForm> createState() => _CareAtHomeFormState();
}

class _CareAtHomeFormState extends State<CareAtHomeForm> {
  String? radiooptions;

  bool _buttonColor = true;
  bool _button2Color = true;
  bool _buttonName = true;

  String userName = "Alexander";

  String mobileNumber = "9875580991";

  String permanentLocation = "Beckenham";

  String healthCardNumber = "000 1111 2222 3333";

  String service = "Name of the Service";

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
      emiValue = false,
      medicalAid = false,
      secondOpinion = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CARE AT HOME")),
      ),
      body: ListView(
        children: [
          BorderedCard(
              child: FormDetailsWidget(
                  userName: userName,
                  mobileNumber: mobileNumber,
                  permanentLocation: permanentLocation,
                  healthCardNumber: healthCardNumber)),
          BorderedCard(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Service required",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(service,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          BorderedCard(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text("Care at home",
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
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
