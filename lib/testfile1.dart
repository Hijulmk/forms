import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//import 'package:home/components/medi_claim_button.dart';
class MediClaim extends StatefulWidget {
  const MediClaim({super.key});

  @override
  State<MediClaim> createState() => _MediClaimState();
}

class _MediClaimState extends State<MediClaim> {
  String selectedamount = "";
  String selectedInsure = "";
  TextEditingController ageInYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(" Mediclaim calculator"),
        backgroundColor: const Color.fromRGBO(0, 153, 204, 1),
      ),
      bottomNavigationBar: Material(
        color: const Color.fromRGBO(0, 153, 204, 1),
        child: InkWell(
          onTap: () {
            if (kDebugMode) {
              print(
                  "data : insure : $selectedInsure, income : $selectedamount, age : ${ageInYearController.text}");
            }
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'Calculate cover amount',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const Text(
              "Calculate cover amount !",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 18.0),
              child: Text(
                  "We just need a few details to calculate the right cover amount for you",
                  style: TextStyle(fontSize: 20, color: Colors.black45),
                  textAlign: TextAlign.start),
            ),
            const Text("who would you like to insure",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start),
            Wrap(
              spacing: 10,
              children: [
                "self",
                "spouse",
                "doughter",
                "son",
                "mother",
                "father",
                "father in law",
                "mother in law",
              ]
                  .map(
                    (e) => CustomChip(
                      text: e,
                      value: selectedInsure == e,
                      onChange: (value) {
                        setState(() {
                          selectedInsure = e;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const Text(
              "Age of the eldest member",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ageInYearController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Age in years',
              ),
            ),
            const Text(
              "Familiy's annual income",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                "< 5 Lacs",
                "5 Lacs - 10 Lacs",
              ]
                  .map(
                    (e) => CustomChip(
                      text: e,
                      value: selectedamount == e,
                      onChange: (value) {
                        if (value) {
                          setState(() {
                            selectedamount = e;
                          });
                        }
                      },
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomChip extends StatefulWidget {
  const CustomChip(
      {super.key,
      required this.text,
      required this.value,
      required this.onChange});
  final String text;
  final bool value;
  final Function(bool) onChange;
  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: widget.value ? Colors.blue : Colors.black),
      ),
      label: Text(widget.text,
          style: TextStyle(color: widget.value ? Colors.blue : Colors.black)),
      backgroundColor: Colors.transparent,
      // shape: StadiumBorder(side: BorderSide()),
      onSelected: widget.onChange,
    );
  }
}