import 'package:flutter/material.dart';

class Proposal extends StatefulWidget {
  const Proposal({ Key? key }) : super(key: key);

  @override
  State<Proposal> createState() => _ProposalState();
}

class _ProposalState extends State<Proposal> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        
        width: 600,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),  
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            // proposal title
            Text("Test Proposal", style: TextStyle(fontSize: 20, color: Colors.white),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 70,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Pro: ", style: TextStyle(color: Colors.black),),
                      // this numbers should be taken of the blockchain
                      Text("0/40e18", style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Against: ", style: TextStyle(color: Colors.black),),
                      // this numbers should be taken of the blockchain
                      Text("0", style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            // should print the description of the proposal
            Text("this is a test proposal is moke and is not connected to the blockchain yet", style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}