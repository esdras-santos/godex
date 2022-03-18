import 'dart:convert';

import 'package:dao/screens/vote_components/create_proposal_screen.dart';
import 'package:dao/screens/vote_components/proposal_screen.dart';
import 'package:dao/screens/vote_components/vote_screen.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import 'liquidity_components/form/liquidity_form.dart';
import 'swap_components/form/swap_form.dart';
import 'dart:typed_data';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget form = CreateProposal();
  String mode = "swap";
  bool connected = false;
  String uiaddr = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.greenAccent,
              Colors.black45,
              Colors.black45,
              Colors.black54,
              Colors.black54,
              Colors.black87,
              Colors.black
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: shader(
              "Canario Swap",
              TextStyle(fontWeight: FontWeight.bold),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.greenAccent,
                      Colors.black45,
                      Colors.black45,
                      Colors.black54,
                      Colors.black54,
                      Colors.black87,
                      Colors.black
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            actions: <Widget>[
              connectButton(),
              SizedBox(width: 20,),
            ],
          ),
          body: form
        ),
      )
      
    );
  }

  Widget shader(String text, TextStyle style) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.green,
          Colors.yellow,
          Colors.green,
        ],
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(text, style: style),
    );
  }

  Widget connectButton() {
    Size size = MediaQuery.of(context).size;
    return !connected ? Container(
      height: 40.0,
      width: size.width * 0.1,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: RaisedButton(
        onPressed: () async {
          
          
        },
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
                ]
              ),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: size.width * 0.4, minHeight: 20.0),
            alignment: Alignment.center,
            child: Text(
              "Connect",
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
    ) : Container(
          padding: EdgeInsets.all(8.0),
          child: Text(uiaddr, style: TextStyle(color: Colors.black, fontSize: 16),),
    );  
  }
}

