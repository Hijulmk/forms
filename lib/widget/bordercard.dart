import 'package:flutter/material.dart';
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
