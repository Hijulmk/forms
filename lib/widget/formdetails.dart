import 'package:flutter/material.dart';

class FormDetailsWidget extends StatelessWidget {
  const FormDetailsWidget({
    Key? key,
    required this.userName,
    required this.mobileNumber,
    required this.permanentLocation,
    required this.healthCardNumber,
  }) : super(key: key);

  final String userName;
  final String mobileNumber;
  final String permanentLocation;
  final String healthCardNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Name",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(userName,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Phone. No",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(mobileNumber,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Location",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text(permanentLocation,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Health Card No.",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(healthCardNumber,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
