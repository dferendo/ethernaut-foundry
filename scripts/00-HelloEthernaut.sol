// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.12;

import {Ethernaut} from './base.sol';
import 'forge-std/Test.sol';

interface IHelloEthernaut {
  function authenticate(string memory passkey) external;
  function password() external view returns (string memory);
}

contract HelloEthernaut is Ethernaut {

  function run() public {
    vm.startBroadcast();

    // Create Instance
    IHelloEthernaut helloEthernaut = IHelloEthernaut(createNewInstance(HELLO_ETHERNAUT));
    // Task
    helloEthernaut.authenticate(helloEthernaut.password());
    // Submission
    submitInstance(HELLO_ETHERNAUT, address(helloEthernaut));

    vm.stopBroadcast();
  }
}