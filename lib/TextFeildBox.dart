import 'package:flutter/material.dart';
class TextFeildBox extends StatelessWidget {
  const TextFeildBox({
    Key? key,
    required this.txt,
    required this.txt1,
  }) : super(key: key);
  final String txt;
  final String txt1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(txt),
        Text(":"),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: TextFormField(
            decoration: InputDecoration(hintText: txt1),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          color: Colors.grey,
          onPressed: () {},
        ),
      ],
    );
  }
}
