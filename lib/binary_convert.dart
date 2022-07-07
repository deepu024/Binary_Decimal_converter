// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:binary_to_decimal/decimal_convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BinaryToDecimal extends StatefulWidget {
  const BinaryToDecimal({Key? key}) : super(key: key);

  @override
  State<BinaryToDecimal> createState() => _BinaryToDecimal();
}

class _BinaryToDecimal extends State<BinaryToDecimal> {
  int decimalNumber = 0;

  final formText = TextEditingController();
  void clearText() {
    formText.clear();
  }

  String binaryNumber = '0';

  calculateDecimal() {
    int decimalNumber1 = int.parse(binaryNumber, radix: 2);
    setState(() {
      decimalNumber = decimalNumber1;
    });
    formText.clear();
  }

  reset() {
    setState(() {
      decimalNumber = 0;
      binaryNumber = "0";
    });
    clearText();
  }

  convert() {
    print(binaryNumber);
  }

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Binary Conversion'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Convert Into Decimal Number!",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Decimal Number",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  decimalNumber.toString(),
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 55,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Binary Number",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Only 0 and 1 otherwise it will give wrong output'),
                Container(
                  width: 200,
                  child: TextFormField(
                    key: _key,
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                    textDirection: TextDirection.ltr,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      label: Text(
                        'Binary Number',
                      ),
                    ),
                    controller: formText,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      binaryNumber = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: calculateDecimal,
                    //Navigator.pushNamed(context, "decimalToBinary");

                    child: Text(
                      "Convert",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: reset,
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
