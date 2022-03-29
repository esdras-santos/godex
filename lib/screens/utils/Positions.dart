import 'dart:html';

import 'package:dao/screens/utils/ABIs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

class Positions extends StatefulWidget {
  List tokensList;
  Positions({ Key? key, required this.tokensList}) : super(key: key);


  @override
  State<Positions> createState() => _PositionsState();
}

class _PositionsState extends State<Positions> {
  ABIs abi = ABIs();
  Map tokenToId = {"GOD":1};
  List positions = [];
  

  @override
  void initState(){
    getPositions();
  }

  Future<void> getPositions() async {
    final acc = await ethereum!.getAccounts();
    final factory = Contract(
      '0xBE4AE2Af3a222de98e8b537Ae7650c7aF1723A88', 
      abi.factory,
      provider!.getSigner()
    );
    List p = [];
    for(int i =0;i< widget.tokensList.length; i++){
      var tokenaddress = await factory.call<String>('getTokenWithId', [tokenToId[widget.tokensList[0]]]);
      var exchangeaddr = await factory.call<String>('getExchange', [tokenaddress]);
      var exchange = exchangeContract(exchangeaddr);
      var balance = await exchange.call<BigInt>('balanceOf', [acc[0]]);
      if(balance != 0){
        var totalSupply = await exchange.call<BigInt>('totalSupply');
        var ckbPool = await provider!.getBalance(exchangeaddr);
        var ckbAmount = balance.toInt() * ckbPool.toInt() / totalSupply.toInt();
        var token = tokenContract(tokenaddress);
        var tokenPool = await token.call<BigInt>('balanceOf', [exchangeaddr]);
        var tokenAmount = balance.toInt() * tokenPool.toInt() / totalSupply.toInt();
        positions.add(Text("CKB: ${ckbAmount}   ${widget.tokensList[0]}: ${tokenAmount}", style: TextStyle(fontWeight: FontWeight.bold)));
      }
    }
    

  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: positions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              
              title: Text(positions[index]),
            ),
          );
        },
      ),
    );
  }

  Contract exchangeContract(String address){
    return Contract(
      address, 
      Interface(abi.exchange),
      provider!.getSigner()
    );
  }

  Contract tokenContract(String address){
    return Contract(
      address, 
      abi.token,
      provider!
    );
  }
}