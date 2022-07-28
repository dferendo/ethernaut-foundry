// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.12;

interface Ethernaut {
  function createLevelInstance(address _level) external payable;
  function submitLevelInstance(address payable _instance) external;
}