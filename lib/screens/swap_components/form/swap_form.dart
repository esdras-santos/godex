import 'package:dao/screens/swap_components/swap_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SwapForm extends StatefulWidget {
  
  @override
  _SwapFormState createState() => _SwapFormState();
}

class _SwapFormState extends State<SwapForm> {
  String coin1 = "images/algologo.png";
  String coin2 = "images/canary.jpg";
  String coin1name = "ALGO";
  String coin2name = "ETH";
  String type = "algo_to_token"; 
  String amount = "0.0";
  String ammAmount = "0.0";
  bool swaporder = false;
  int algo_reserve = 0;
  int token_reserve = 0;

  List<String> cryptoList = ["ALGO", "ETH", "BTC"];


  var amountController = TextEditingController();

  @override
  void initState(){
    super.initState();
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
    return Column(
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
                              controller: amountController,
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
                                  var str = value.split('.');
                                  amount = str.join();
                                  if(type == "algo_to_token"){
                                    ammAmount = "${amm(int.parse(amount), algo_reserve,token_reserve)}";
                                  }else{
                                    ammAmount = "${amm(int.parse(amount), token_reserve,algo_reserve)}";
                                  }
                                  
                                });
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft, 
                            child: DropdownButton<String>(
                              style: TextStyle(fontSize: 20),
                              elevation: 1,
                              value: coin1name,
                              items: cryptoList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  coin1name = value!;
                                });
                              }
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
                              controller: amountController,
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
                                  var str = value.split('.');
                                  amount = str.join();
                                  if(type == "algo_to_token"){
                                    ammAmount = "${amm(int.parse(amount), algo_reserve,token_reserve)}";
                                  }else{
                                    ammAmount = "${amm(int.parse(amount), token_reserve,algo_reserve)}";
                                  }
                                  
                                });
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft, 
                            child: DropdownButton<String>(
                              style: TextStyle(fontSize: 20),
                              elevation: 1,
                              value: coin2name,
                              items: cryptoList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  coin2name = value!;
                                });
                              }
                            ),
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
    );
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