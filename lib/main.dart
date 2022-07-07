// ignore_for_file: prefer_const_constructors

import 'package:binary_to_decimal/decimal_convert.dart';
import 'package:flutter/material.dart';
import 'binary_convert.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.orange,
      ),
      title: 'Binary Conversion',
      home: HomePage(),
      routes: {
        "binaryToDecimal": (context) => BinaryToDecimal(),
        "decimalToBinary": (context) => DecimalToBinary(),
      },
    );
  }
}
