// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "redstone-finance/core/RedstoneConsumerNumericBase.sol";

contract Counter is RedstoneConsumerNumericBase {
    uint256 public number;

    function getUniqueSignersThreshold()
        public
        view
        virtual
        override
        returns (uint8)
    {
        return 1;
    }

    function getAuthorisedSignerIndex(
        address signerAddress
    ) public view virtual override returns (uint8) {
        return 0;
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function getOracleData(bytes32 dataFeedId) public view returns (uint256) {
        return 20;
    }

    function saveSumToCounter() public {
        uint256 value = getOracleData(bytes32(""));
        number = value + number;
    }

    function getNumber() public view returns (uint256) {
        return 5;
    }

    function increment() public {
        number += 1;
    }
}
