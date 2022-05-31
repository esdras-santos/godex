import 'package:flutter_web3/flutter_web3.dart';

import 'ABIs.dart';

class Interfaces {
  ABIs abi = ABIs();

  Contract factory() {
    return Contract("0x4A1128c48765FD8bA5B961515E76958D12733023",
        Interface(abi.factoryAbi), provider!.getSigner());
  }

  Contract factoryro() {
    return Contract("0x4A1128c48765FD8bA5B961515E76958D12733023",
        Interface(abi.factoryAbi), provider!);
  }

}