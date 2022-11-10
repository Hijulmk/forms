import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/formdetails.dart';

class SpecialCareForm extends StatefulWidget {
  const SpecialCareForm({super.key});

  @override
  State<SpecialCareForm> createState() => _SpecialCareFormState();
}

class _SpecialCareFormState extends State<SpecialCareForm> {
  String? radiooptions;

  bool _buttonColor = true;
  bool _button2Color = true;
  bool _buttonName = true;

  String userName = "Alexander";

  String mobileNumber = "9875580991";

  String permanentLocation = "Beckenham";

  String healthCardNumber = "000 1111 2222 3333";

  String specialCareName = "Special Care Name";

  pickImage(bool isCamera) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      imgLst.add(pickedImage!);
    });
  }

  List<XFile> imgLst = [];

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Special Care",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(specialCareName,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          BorderedCard(
              child: FormDetailsWidget(
                  userName: userName,
                  mobileNumber: mobileNumber,
                  permanentLocation: permanentLocation,
                  healthCardNumber: healthCardNumber)),
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
                        imgLst.isEmpty ? "Add Report" : "Add More Data",
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
                                                pickImage(true);
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
                                                  pickImage(false);
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
                    if (imgLst.isNotEmpty)
                      Expanded(
                        child: SizedBox(
                          height: 160,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: imgLst.length,
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
                                            File(imgLst.elementAt(index).path),
                                          ),
                                        )),
                                    Stack(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                imgLst.removeAt(index);
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

class BorderedCard extends StatelessWidget {
  const BorderedCard({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color.fromRGBO(0, 153, 204, 1)),
              borderRadius: BorderRadius.circular(10.0)),
          child: child),
    );
  }
}
