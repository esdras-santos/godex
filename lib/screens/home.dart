import 'dart:convert';

import 'package:dao/screens/pool_components/add_liquidity_screen.dart';
import 'package:dao/screens/pool_components/pool_screen.dart';
import 'package:dao/screens/vote_components/create_proposal_screen.dart';
import 'package:dao/screens/vote_components/proposal_screen.dart';
import 'package:dao/screens/vote_components/vote_screen.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';


import 'swap_components/form/swap_form.dart';
import 'dart:typed_data';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget form = SwapForm();
  String mode = "swap";
  bool connected = false;

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
      child: SwapForm());
  }

  

  
}

