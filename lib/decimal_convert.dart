// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecimalToBinary extends StatefulWidget {
  const DecimalToBinary({Key? key}) : super(key: key);

  @override
  State<DecimalToBinary> createState() => _DecimalToBinary();
}

class _DecimalToBinary extends State<DecimalToBinary> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  int binaryNumber = 0;
  var decimalNumber = '0';

  final formText = TextEditingController();

  reset() {
    setState(() {
      binaryNumber = 0;
      decimalNumber = '0';
    });
    formText.clear();
  }

  calculateBinary() {
    int num = int.parse(decimalNumber);
    final convertedBinary = num.toRadixString(2);
    setState(() {
      binaryNumber = int.parse(convertedBinary);
    });
    formText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Decimal Conversion'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Convert Into Binary Number!",
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
                Text(
                  binaryNumber.toString(),
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 55,
                      fontWeight: FontWeight.bold),
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
                Container(
                  width: 200,
                  child: TextFormField(
                    key: _key,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    textDirection: TextDirection.ltr,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      label: Text(
                        'Decimal Number',
                      ),
                    ),
                    controller: formText,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      decimalNumber = val;
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
                    onPressed: calculateBinary,
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
