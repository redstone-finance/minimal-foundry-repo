// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "redstone-finance/data-services/TwapsDemoConsumerBase.sol";

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number += 2;
    }
}
