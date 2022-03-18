import 'package:flutter/material.dart';

class CreateProposal extends StatefulWidget {
  const CreateProposal({ Key? key }) : super(key: key);

  @override
  State<CreateProposal> createState() => _CreateProposalState();
}

class _CreateProposalState extends State<CreateProposal> {
  String action = "Transfer Token";
  String token = "GOD";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 600,
        height: 540,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),  
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            // proposal title
            Text("Create Proposal", style: TextStyle(fontSize: 20, color: Colors.white),),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){

              },
              child: Container(
                width: 580,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      
                      alignment: Alignment.centerLeft,
                      child: Text("   Proposed Action", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("  "+action, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.black,
                          size: 30,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 580,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),  
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("  To:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left:8.0),
                    width: 530,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 18),
                        hintText: "0x0",
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState((){
                          
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: 580,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),  
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left:8.0),
                    width: 480,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20),
                        hintText: "0.0",
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState((){
                          
                        });
                      },
                    ),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      width: 100,
                      child: Row(
                        children: [
                          Text(token, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.black,
                            size: 30,
                          )
                        ]
                      )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: 580,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),  
              ),
              child: Container(
                padding: const EdgeInsets.only(left:8.0),
                width: 530,
                child: TextFormField(
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 18),
                    hintText: "Proposal Title",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState((){
                      
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 580,
              height: 230,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),  
              ),
              child: Container(
                padding: const EdgeInsets.only(left:8.0),
                width: 530,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 18),
                    hintText: "Proposal Description",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState((){
                      
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}