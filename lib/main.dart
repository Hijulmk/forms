import 'package:flutter/material.dart';
import 'package:forms/screens/cancercare.dart';
import 'package:forms/screens/care_at_homefinal.dart';
import 'package:forms/screens/secondopinion.dart';
import 'package:forms/screens/specialcare.dart';
import 'package:forms/screens/surgicalcare.dart';
import 'package:forms/test.dart';
import 'package:forms/screens/companion.dart';
import 'package:forms/screens/surgicalcare.dart';
import 'package:forms/testfile1.dart';
import 'package:forms/testfile3.dart';
import 'package:forms/screens/samplecollection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MediClaim(),
    );
  }
}
