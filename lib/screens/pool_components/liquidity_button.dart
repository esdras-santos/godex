import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:dart_web3/dart_web3.dart';
import 'package:dao/screens/utils/ABIs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/AMM.dart';


class LiquidityButton extends StatefulWidget {

  String amount1;
  String amount2;
  String tokenSymbol;

  LiquidityButton({Key? key, required this.amount1, required this.amount2, required this.tokenSymbol}) : super(key: key);

  @override
  _LiquidityButtonState createState() => _LiquidityButtonState();
}

class _LiquidityButtonState extends State<LiquidityButton> {
  ABIs abi = ABIs();

  late Contract gs;
  late Contract factory;
  late Contract exchange;
  late Contract token;
  Map tokenToIndex = {"GOD":1};

  _SwapButtonState(){
    gs = Contract(
      '0xBE4AE2Af3a222de98e8b537Ae7650c7aF1723A88', 
      abi.gs,
      provider!
    );
    factory = Contract(
      '0xBE4AE2Af3a222de98e8b537Ae7650c7aF1723A88', 
      abi.factory,
      provider!.getSigner()
    );
    
    
  }

  @override
  void initState(){
    super.initState();
    // initContracts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 55.0,
      width: size.width * 0.341,
      child: RaisedButton(
        onPressed: () async {
          var tokenaddress = await factory.call<String>('getTokenWithId', [tokenToIndex[widget.tokenSymbol]]);
          var exchangeaddr = await factory.call<String>('getExchange', [tokenaddress]);
          exchange = exchangeContract(exchangeaddr);
          var token = tokenContract(tokenaddress);
          final approvetx = await token.send('approve',
            [exchangeaddr, widget.amount2],
            TransactionOverride(
              gasPrice: BigInt.from(6000000),
            ),
          );
          approvetx.wait();

          final altx = await exchange.send('addLiquidity',
            [widget.amount1, widget.amount2, (DateTime.now().millisecondsSinceEpoch/1000)+(60*10)],
            TransactionOverride(
              value: BigInt.from(num.parse(widget.amount1)),
              gasPrice: BigInt.from(6000000),
            ),
          );

          altx.wait();

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
                ],
              ),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: size.width * 0.4, minHeight: 20.0),
            alignment: Alignment.center,
            child: Text(
              "ADD LIQUIDITY",
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

  Contract tokenContract(String address){
    return Contract(
      address, 
      abi.token,
      provider!
    );
  }

  Contract exchangeContract(String address){
    return Contract(
      address, 
      Interface(abi.exchange),
      provider!.getSigner()
    );
  }
}