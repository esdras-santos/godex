import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class SwapButton extends StatefulWidget {
  String type;
  String amount;

  SwapButton({Key? key, required this.type, required this.amount}) : super(key: key);

  @override
  _SwapButtonState createState() => _SwapButtonState();
}

class _SwapButtonState extends State<SwapButton> {

  @override
  void initState(){
    super.initState();

  }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 55.0,
      width: size.width * 0.341,
      child: RaisedButton(
        onPressed: () async {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.green,
                  Colors.yellow,
                  Colors.green,
                ],
              ),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: size.width * 0.4, minHeight: 20.0),
            alignment: Alignment.center,
            child: Text(
              "SWAP",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}