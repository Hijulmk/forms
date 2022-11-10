import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:forms/screens/specialcare.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widget/formdetails.dart';

class CompanionForm extends StatefulWidget {
  const CompanionForm({super.key});

  @override
  State<CompanionForm> createState() => _CompanionFormState();
}

class _CompanionFormState extends State<CompanionForm> {
  String? radiooptions;

  bool _buttonColor = true;
  bool _button2Color = true;
  bool _buttonName = true;

  String userName = "Alexander";

  String mobileNumber = "9875580991";

  String permanentLocation = "Beckenham";

  String healthCardNumber = "000 1111 2222 3333";

  String companion = "Companion Details";

  pickLabTestData(bool isCamera) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      companionUploads.add(pickedImage!);
    });
  }

  

  List companionUploads = [];

  bool patientloanValue = false,
      emiValue = false,
      medicalAid = false,
      secondOpinion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("COMPANION")),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your companion",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(companion,
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Required description",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
          BorderedCard(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("About yourself",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                      companionUploads.isEmpty
                            ? "Uploads"
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
                    if (companionUploads.isNotEmpty)
                      Expanded(
                        child: SizedBox(
                          height: 160,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: companionUploads.length,
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
                                            File(companionUploads
                                                .elementAt(index)
                                                .path),
                                          ),
                                        )),
                                    Stack(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                companionUploads.removeAt(index);
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
          
          BorderedCard(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Describe about your companions requirement",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
