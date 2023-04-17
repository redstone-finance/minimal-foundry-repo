// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "redstone-finance/core/RedstoneConsumerNumericBase.sol";

contract Counter is RedstoneConsumerNumericBase {
    uint256 public number;
    error NotAuthorizedOracle();

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
        // authorize everyone
        return 0;
    }

    function validateTimestamp(
        uint256 receivedTimestampMilliseconds
    ) public view override {
        // allow any timestamp
    }

    function saveOracleData(bytes32 dataFeedId) public {
        uint256 value = getOracleNumericValueFromTxMsg(dataFeedId);
        number = value + number;
    }
}
