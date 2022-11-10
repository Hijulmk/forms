import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:forms/screens/specialcare.dart';
import 'package:image_picker/image_picker.dart';

import '../../widget/formdetails.dart';

class CancerCareForm extends StatefulWidget {
  const CancerCareForm({super.key});

  @override
  State<CancerCareForm> createState() => _CancerCareFormState();
}

class _CancerCareFormState extends State<CancerCareForm> {
  String? radiooptions;

  bool _buttonColor = true;
  bool _button2Color = true;
  bool _buttonName = true;

  String userName = "Alexander";

  String mobileNumber = "9875580991";

  String permanentLocation = "Beckenham";

  String healthCardNumber = "000 1111 2222 3333";

  String surgeryName = "Name of the surgery";

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
      reportList.add(pickedImage!);
    });
  }

  List labTestList = [];
  List reportList = [];

  bool patientloanValue = false,
      emiValue = false,
      medicalAid = false,
      secondOpinion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Book your free consultation")),
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Symptoms issue",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Expanded(flex: 2,
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
          BorderedCard(
            child: Column(
              children: [
                CheckboxListTile(
                  title: const Text("Get No Cost Emi"),
                  value: emiValue,
                  onChanged: (bool? value) {
                    setState(() {
                      emiValue = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Get Patient Loan"),
                  value: patientloanValue,
                  onChanged: (bool? value) {
                    setState(() {
                      patientloanValue = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Get Second Opinion"),
                  value: secondOpinion,
                  onChanged: (bool? value) {
                    setState(() {
                      secondOpinion = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Get Another Medical Aid"),
                  value: medicalAid,
                  onChanged: (bool? value) {
                    setState(() {
                      medicalAid = value!;
                    });
                  },
                )
              ],
            ),
          ),
          Divider(),
          BorderedCard(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        labTestList.isEmpty
                            ? "Add Lab Test Report"
                            : "Add More Data",
                      ),
                      onPressed: () {
                        setState(() {
                          _buttonName = false;
                          _button2Color = false;
                        });

                        showDialog(
                            context: context,
                            builder: (cntxtRcv) {
                              return AlertDialog(
                                  title: Center(child: Text("Choose Option")),
                                  content: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                pickLabTestData(true);
                                                Navigator.pop(context);
                                              },
                                              child: Icon(Icons.camera_alt),
                                            ),
                                            Text("Camera"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  pickLabTestData(false);
                                                },
                                                child: Icon(Icons.photo)),
                                            Text("Gallery")
                                          ],
                                        ),
                                      )
                                    ],
                                  ));
                            });
                      },
                    ),
                    if (labTestList.isNotEmpty)
                      Expanded(
                        child: SizedBox(
                          height: 160,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: labTestList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    0, 153, 204, 1))),
                                        margin: EdgeInsets.all(3),
                                        height: 100,
                                        width: 100,
                                        child: Center(
                                          child: Image.file(
                                            File(labTestList.elementAt(index).path),
                                          ),
                                        )),
                                    Stack(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                labTestList.removeAt(index);
                                              });
                                            },
                                            icon: Icon(Icons.close_rounded))
                                      ],
                                    )
                                  ],
                                );
                              }),
                        ),
                      )
                    else
                      Container(),
                  ],
                ),
              ),
            ),
          ),
          // ReportData
          BorderedCard(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        reportList.isEmpty ? "Add Report" : "Add More Data",
                      ),
                      onPressed: () {
                        setState(() {
                          _buttonName = false;
                          _button2Color = false;
                        });

                        showDialog(
                            context: context,
                            builder: (cntxtRcv) {
                              return AlertDialog(
                                  title: Center(child: Text("Choose Option")),
                                  content: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                pickReportListData(true);
                                                Navigator.pop(context);
                                              },
                                              child: Icon(Icons.camera_alt),
                                            ),
                                            Text("Camera"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  pickReportListData(false);
                                                },
                                                child: Icon(Icons.photo)),
                                            Text("Gallery")
                                          ],
                                        ),
                                      )
                                    ],
                                  ));
                            });
                      },
                    ),
                    if (reportList.isNotEmpty)
                      Expanded(
                        child: SizedBox(
                          height: 160,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: reportList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    0, 153, 204, 1))),
                                        margin: EdgeInsets.all(3),
                                        height: 100,
                                        width: 100,
                                        child: Center(
                                          child: Image.file(
                                            File(reportList.elementAt(index).path),
                                          ),
                                        )),
                                    Stack(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                reportList.removeAt(index);
                                              });
                                            },
                                            icon: Icon(Icons.close_rounded))
                                      ],
                                    )
                                  ],
                                );
                              }),
                        ),
                      )
                    else
                      Container(),
                  ],
                ),
              ),
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

