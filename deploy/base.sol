// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.12;

import 'forge-std/Test.sol';

interface IEthernaut {
  function createLevelInstance(address _level) external payable;
  function submitLevelInstance(address payable _instance) external;
}

abstract contract Ethernaut is Test {
  IEthernaut constant ethernaut = IEthernaut(0xD991431D8b033ddCb84dAD257f4821E9d5b38C33);

  // Levels addresses
  address constant HELLO_ETHERNAUT = address(0x4E73b858fD5D7A5fc1c3455061dE52a53F35d966);
}