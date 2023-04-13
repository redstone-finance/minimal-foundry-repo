// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testIncrement() public {
        // bytes memory encodedFunction = abi.encodeWithSignature("increment()");
        // bytes memory encodedFunctionWithRedstonePayload = abi.encodePacked(
        //     encodedFunction,
        //     ""
        // );

        // // Securely getting oracle value
        // (bool success, ) = address(counter).call(
        //     encodedFunctionWithRedstonePayload
        // );

        vm.mockCall(
            address(counter),
            abi.encodeWithSelector(Counter.getOracleData.selector),
            abi.encode(10)
        );

        counter.saveSumToCounter();

        assertEq(counter.number(), 10);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
