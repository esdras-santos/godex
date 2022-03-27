import 'package:dao/screens/swap_components/swap_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/default_appbar.dart';
import '../../utils/hero_dialog_route.dart';


class SwapForm extends StatefulWidget {
  
  @override
  _SwapFormState createState() => _SwapFormState();
}

String _heroSwap = "heroswap";

class _SwapFormState extends State<SwapForm> {
  String coin1 = "images/algologo.png";
  String coin2 = "images/canary.jpg";
  String coin1name = "ALGO";
  String coin2name = "ETH";
  String type = "algo_to_token"; 
  String amount = "0.0";
  String ammAmount = "0.0";
  bool swaporder = false;
  TextEditingController _token1Controller = TextEditingController();
  TextEditingController _token2controller = TextEditingController();
  String token1Amount = '';
  String token2Amount = '';
  
  List<Widget> tokensList1 = [];
  List<Widget> tokensList2 = [];

  List<String> cryptoList = ["GOD", "ETH", "CKB"];



  @override
  void initState(){
    super.initState();
    tokensList1 = tl(1);
    tokensList2 = tl(2);
  }

  int amm(int amount, int input_reserve, int output_reserve){
    int input_amount_with_fee = amount * 997;
    int numerator = input_amount_with_fee * output_reserve;
    int denominator = (input_reserve * 1000) + input_amount_with_fee;
    return (numerator ~/ denominator);
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
                        
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric( vertical: 5),
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
                                width: 360,
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  controller: _token1Controller,
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
                                      token1Amount = value;
                                      _token2controller = TextEditingController(text: 'Initial value');
                                    });
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft, 
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                                      return _listCoinsPopupCard(1, _heroSwap+"1");
                                    }));
                                  },
                                  child: Hero(
                                    tag: _heroSwap+"1",
                                    child: Container(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          Material(
                                            child: Text(coin1name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                                          Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: Colors.black,
                                            size: 30,
                                          )
                                        ]
                                      )
                                    ),
                                  ),
                                ),
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
                          padding: EdgeInsets.symmetric(vertical: 5),
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
                                width: 360,
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  controller: _token2controller,
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
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                                      return _listCoinsPopupCard(2, _heroSwap+"2");
                                    }));
                                  },
                                  child: Hero(
                                    tag: _heroSwap+"2",
                                    child: Container(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          Material(
                                            child: Text(coin2name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                                          Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: Colors.black,
                                            size: 30,
                                          )
                                        ]
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SwapButton(type: type, amount: amount)
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
              coin1name = cryptoList[0];
            } else{
              coin2name = cryptoList[0];
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
              coin1name = cryptoList[1];
            } else{
              coin2name = cryptoList[1];
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
              coin1name = cryptoList[2];
            } else{
              coin2name = cryptoList[2];
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