// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract MockRedstonePayload is Test {
    function getRedstonePayload(
        // dataFeedId:value:decimals
        string memory priceFeed
    ) public returns (bytes memory) {
        string[] memory args = new string[](3);
        args[0] = "node";
        args[1] = "getRedstonePayload.js";
        args[2] = priceFeed;

        return vm.ffi(args);
    }
}

contract CounterTest is Test, MockRedstonePayload {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testOracleData() public {
        bytes memory redstonePayload = getRedstonePayload("BTC:120:8,ETH:69:8");

        bytes memory encodedFunction = abi.encodeWithSignature(
            "saveOracleData(bytes32)",
            bytes32("BTC")
        );
        bytes memory encodedFunctionWithRedstonePayload = abi.encodePacked(
            encodedFunction,
            redstonePayload
        );

        // Securely getting oracle value
        (bool success, ) = address(counter).call(
            encodedFunctionWithRedstonePayload
        );
        assertEq(success, true);
        // 120 * 10 ** 8
        assertEq(counter.number(), 12000000000);
    }
}
