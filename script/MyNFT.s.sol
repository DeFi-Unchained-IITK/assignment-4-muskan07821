// SPDX-License-Identifier:MIT

pragma solidity 0.8.20;

import "forge-std/Script.sol";
import "../src/MyNFT.sol";

contract deployScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        new MyNFT();
        vm.stopBroadcast();
    }
}

