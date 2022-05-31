import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ABIs {
  String gs = "";
  String factory = "";
  
  String token = "";
  String governor = "";
  List<String> treasury = [];

  List<String> factoryAbi = [
    "function createExchange(address) external returns(address)",
    "function getExchange(address) external view returns(address)",
    "function getToken(address exchange) external view returns(address)",
    "function getTokenWithId(uint256 tokenid) external view returns(address)"
  ];

  List<String> exchange = [
    "function addLiquidity(uint256, uint256, uint256) public payable returns(uint256)",
    "function removeLiquidity(uint256, uint256, uint256, uint256) public returns(uint256, uint256)",
    "function ethToTokenSwapOutput(uint256, uint256) public payable returns(uint256)",
    "function tokenToEthSwapOutput(uint256, uint256, uint256) public returns(uint256)",
    "function tokenToTokenSwapOutput(uint256, uint256, uint256, uint256, address) public returns(uint256)"
  ];
}
