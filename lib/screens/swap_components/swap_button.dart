import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:dart_web3/dart_web3.dart';
import 'package:dao/screens/utils/ABIs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/AMM.dart';
import '../utils/interfaces.dart';

class SwapButton extends StatefulWidget {
  String type;
  String amount1;
  String amount2;
  int tokenIndex1;
  int tokenIndex2;

  SwapButton(
      {Key? key,
      required this.type,
      required this.amount1,
      required this.amount2,
      required this.tokenIndex1,
      this.tokenIndex2 = 0})
      : super(key: key);

  @override
  _SwapButtonState createState() => _SwapButtonState();
}

class _SwapButtonState extends State<SwapButton> {
  ABIs abi = ABIs();

  late Contract gs;
  late Contract exchange;
  late Contract token;

  Interfaces inter = Interfaces();

  @override
  void initState() {
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
          try {
            var tokenaddress = await inter.factoryro()
                .call<String>('getTokenWithId', [widget.tokenIndex1]);
            var exchangeaddr =
                await inter.factoryro().call<String>('getExchange', [tokenaddress]);
            exchange = exchangeContract(exchangeaddr);
            token = tokenContract(tokenaddress);
            if (widget.type == "token_to_token") {
              var tokenaddress2 = await inter.factoryro()
                  .call<String>('getTokenWithId', [widget.tokenIndex2]);
              var exchangeaddr2 =
                  await inter.factoryro().call<String>('getExchange', [tokenaddress2]);
              var exchange2 = exchangeContract(exchangeaddr2);
              var token2 = tokenContract(tokenaddress2);
              var MATICpool = await provider!.getBalance(exchangeaddr);
              var tokenpool =
                  await token2.call<BigInt>('balanceOf', [exchangeaddr]);
              var ethsold = amm(int.parse(widget.amount1), MATICpool.toInt(),
                  tokenpool.toInt());
              final approvetx = await token.send(
                'approve',
                [exchangeaddr2, widget.amount2],
                TransactionOverride(
                  gasPrice: BigInt.from(6000000),
                ),
              );
              approvetx.wait();

              final tx = await exchange2.send(
                'tokenToTokenSwapOutput',
                [
                  widget.amount1,
                  widget.amount2,
                  ethsold,
                  (DateTime.now().millisecondsSinceEpoch / 1000) + (60 * 10),
                  tokenaddress2
                ],
                TransactionOverride(
                  gasPrice: BigInt.from(6000000),
                ),
              );
              print(tx.hash);

              final receipt = tx.wait();
              print(receipt);
            } else if (widget.type == "token_to_MATIC") {
              // args: MATIC, token , deadline
              final approvetx = await token.send(
                'approve',
                [exchangeaddr, widget.amount2],
                TransactionOverride(
                  gasPrice: BigInt.from(6000000),
                ),
              );
              approvetx.wait();

              final tx = await exchange.send(
                'tokenToEthSwapOutput',
                [
                  widget.amount1,
                  widget.amount2,
                  (DateTime.now().millisecondsSinceEpoch / 1000) + (60 * 10)
                ],
                TransactionOverride(
                  gasPrice: BigInt.from(6000000),
                ),
              );
              print(tx.hash);

              final receipt = tx.wait();
              print(receipt);
            } else if (widget.type == "MATIC_to_token") {
              final tx = await exchange.send(
                'ethToTokenSwapOutput',
                [
                  widget.amount1,
                  (DateTime.now().millisecondsSinceEpoch / 1000) + (60 * 10)
                ],
                TransactionOverride(
                  value: BigInt.from(num.parse(widget.amount2)),
                  gasPrice: BigInt.from(6000000),
                ),
              );
              print(tx.hash);
              final receipt = tx.wait();
              print(receipt);
            }
          } on Exception catch (e) {
            print("EXCEPTION: " + e.toString());
          }
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

  Contract tokenContract(String address) {
    return Contract(address, abi.token, provider!);
  }

  Contract exchangeContract(String address) {
    return Contract(address, Interface(abi.exchange), provider!.getSigner());
  }
}
