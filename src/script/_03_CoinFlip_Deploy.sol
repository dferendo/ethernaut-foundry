// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.11;

import 'forge-std/Test.sol';
import {_03_CoinFlip} from '../_03_CoinFlip.sol';

contract _03_CoinFlip_Deploy is Test {

    // Contracts
    _03_CoinFlip CoinFlip;

    function run() public {
        vm.startBroadcast();
        // Deploy contract
        CoinFlip = new _03_CoinFlip();
        vm.stopBroadcast();
    }

}