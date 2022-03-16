import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'dart:typed_data';


class LiquidityButton extends StatefulWidget {
  String option;
  String algoAmount;
  String tokenAmount;
  LiquidityButton({Key? key, required this.option, required this.algoAmount, required this.tokenAmount}) : super(key: key);
  @override
  _LiquidityButtonState createState() => _LiquidityButtonState();
}

class _LiquidityButtonState extends State<LiquidityButton> {
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 55.0,
      width: size.width * 0.2,
      child: RaisedButton(
        onPressed: () async{},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
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
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: size.width * 0.4, minHeight: 20.0),
            alignment: Alignment.center,
            child: Text(
              widget.option + " liquidity",
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