// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.12;

import 'forge-std/Test.sol';

interface IEthernaut {
    function createLevelInstance(address _level) 
        external 
        payable;

    function submitLevelInstance(address payable _instance) 
        external;
}

interface ILevel {
    function validateInstance(address payable _instance, address _player)
        external
        view
        returns (bool);
}

abstract contract Ethernaut is Test {
    IEthernaut constant ethernaut = IEthernaut(0xD991431D8b033ddCb84dAD257f4821E9d5b38C33);

    // Levels addresses
    address constant HELLO_ETHERNAUT = address(0x4E73b858fD5D7A5fc1c3455061dE52a53F35d966);
    address constant FALLBACK = address(0x9CB391dbcD447E645D6Cb55dE6ca23164130D008);
    address constant FALLOUT = address(0x5732B2F88cbd19B6f01E3a96e9f0D90B917281E5);
    address constant COIN_FLIP = address(0x4dF32584890A0026e56f7535d0f2C6486753624f);

    function createNewInstance(address level)
        internal
        returns (address)
    {
        vm.recordLogs();
      // Create normal instance
        ethernaut.createLevelInstance(level);

        // Get instance address from logs
        Vm.Log[] memory entries = vm.getRecordedLogs();
        return abi.decode(entries[0].data, (address));
    }

    function submitInstance(address level, address instance) internal {
        require(
            ILevel(level).validateInstance(payable(instance), msg.sender),
            "Invalid-Submission"
        );
        ethernaut.submitLevelInstance(payable(instance));
    }
}