import "package:flutter/material.dart";

class VoteScreen extends StatefulWidget {
  const VoteScreen({ Key? key }) : super(key: key);

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Proposals",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Container(
                  height: 40.0,
                  width: 160,
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
                            BoxConstraints(maxWidth: 160, minHeight: 20.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Create Proposal",
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
                )
              ],
            )
          ],
        )
      ),
    );
  }
}