import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/custom_rect_tween.dart';
import '../utils/default_appbar.dart';
import '../utils/hero_dialog_route.dart';

class AddLiquidity extends StatefulWidget {
  const AddLiquidity({ Key? key }) : super(key: key);

  @override
  State<AddLiquidity> createState() => _AddLiquidityState();
}



class _AddLiquidityState extends State<AddLiquidity> {
  
  String token1 = "GOD";
  String token2 = "CKB";
  List<Widget> tokensList1 = [];
  List<Widget> tokensList2 = [];
  List<String> cryptoList = ["GOD", "ETH", "CKB"];
  

  @override
  void initState(){
    super.initState();
    tokensList1 = tl(1);
    tokensList2 = tl(2);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: DefaultAppbar()
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 500,
                child: Container(
                  width: 600,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black45,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: Offset(5.0, 5.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Container(
                    height: 300,
                    width: 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                                  return _listCoinsPopupCard(1, _heroAddLiquidity+"1");
                                }));
                              },
                              child: Hero(
                                tag: _heroAddLiquidity+"1",
                                // createRectTween: (begin, end) {
                                //   return CustomRectTween(begin: begin!, end: end!);
                                // },
                                child: Container(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        Material(
                                          color: Colors.black12,
                                          child: Text(token1, style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold))),
                                        Icon(
                                          Icons.arrow_drop_down_sharp,
                                          color: Colors.white,
                                          size: 30,
                                        )
                                      ]
                                    )
                                  ),
                              
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                                  return _listCoinsPopupCard(2, _heroAddLiquidity+"2");
                                }));
                              },
                              child: Hero(
                                tag: _heroAddLiquidity+"2",
                                // createRectTween: (begin, end) {
                                //   return CustomRectTween(begin: begin!, end: end!);
                                // },
                                child: Container(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        Material(
                                          color: Colors.black12,
                                          child: Text(token2, style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold))),
                                        Icon(
                                          Icons.arrow_drop_down_sharp,
                                          color: Colors.white,
                                          size: 30,
                                        )
                                      ]
                                    )
                                  ),
                              
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          height: 70,
                          width: 590,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left:8.0),
                                width: 340,
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  // keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    CurrencyTextInputFormatter(maxInputValue: 99999999999999),
                                  ],
                                  cursorColor: Colors.green,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(fontSize: 25),
                                    hintStyle: TextStyle(fontSize: 25),
                                    hintText: "0.0",
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    setState((){
                                      
                                    });
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft, 
                                child: Text(token1, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        Ink(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle
                          ),
                          child: IconButton(
                            iconSize: 30,
                            icon: const Icon(Icons.swap_vert),
                            tooltip: 'Swap order',
                            onPressed: () {
                              setState(() {
                                
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          height: 70,
                          width: 590,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left:8.0),
                                width: 340,
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  // keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    CurrencyTextInputFormatter(maxInputValue: 99999999999999),
                                  ],
                                  cursorColor: Colors.green,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(fontSize: 25),
                                    hintStyle: TextStyle(fontSize: 25),
                                    hintText: "0.0",
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    setState((){
                                    });
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft, 
                                child: Text(token2, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listCoinsPopupCard(int t, String tag){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Hero(
          tag: tag,
          // createRectTween: (begin, end){
          //   return CustomRectTween(begin: begin!, end: end!);
          // },
          child: Material(
            color: Colors.black,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 150,
              width: 200,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Chose Token", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: t == 1 ? tokensList1 : tokensList2,
                      ),
                      SizedBox(height: 10),
                    ]
                  ),
                ),
              ),
            )
          ),
        ),
      )
    );
  }

  List<Widget> tl(int t){
    List<Widget> tokensList = [];
    tokensList.add(
      InkWell(
        onTap: (){
          setState((){
            if(t == 1){
              token1 = cryptoList[0];
            } else{
              token2 = cryptoList[0];
            }
          });
          Navigator.pop(context);
        },
        child: Text(cryptoList[0], style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
      )
    );
    tokensList.add(
      InkWell(
        onTap: (){
          setState((){
            if(t == 1){
              token1 = cryptoList[1];
            } else{
              token2 = cryptoList[1];
            }
          });
          Navigator.pop(context);
        },
        child: Text(cryptoList[1], style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
      )
    );
    tokensList.add(
      InkWell(
        onTap: (){
          setState((){
            if(t == 1){
              token1 = cryptoList[2];
            } else{
              token2 = cryptoList[2];
            }
          });
          Navigator.pop(context);
        },
        child: Text(cryptoList[2], style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
      )
    );
    return tokensList;
  }
}

const String _heroAddLiquidity = 'add-liquidity-hero';



class CurrencyTextInputFormatter extends TextInputFormatter{
  final double maxInputValue;

  CurrencyTextInputFormatter({required this.maxInputValue});
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final regEx = RegExp(r'^\d*\.?\d*');
    String newString = regEx.stringMatch(newValue.text) ?? '';
    
    if(maxInputValue != null){
      if(double.tryParse(newValue.text) == null){
        return TextEditingValue(
          text: newString,
          selection: newValue.selection,
        );
      }
      if(double.tryParse(newValue.text)! > maxInputValue){
        newString = maxInputValue.toString();
      }
    }
    return TextEditingValue(
      text: newString,
      selection: newValue.selection
    );
  }

}