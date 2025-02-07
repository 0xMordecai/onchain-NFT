// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "script/DeployNft.s.sol";
import {FirstNft} from "src/FirstNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    FirstNft public firstNft;
    address public USER = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        firstNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Kitten";
        string memory actualName = firstNft.name();

        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        firstNft.mintNft(PUG);

        assert(firstNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(PUG)) ==
                keccak256(abi.encodePacked(firstNft.tokenURI(0)))
        );
    }
}
