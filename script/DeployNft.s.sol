// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FirstNft} from "../src/FirstNft.sol";

contract DeployBasicNft is Script {
    function run() external returns (FirstNft) {
        vm.startBroadcast();
        FirstNft firstNft = new FirstNft();
        vm.stopBroadcast();
        return firstNft;
    }
}
