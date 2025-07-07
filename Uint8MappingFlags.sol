// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Mapping of uint256 => uint8
/// @notice This contract stores flags as uint8 instead of bool
contract Uint8MappingFlags {
    /// @notice Mapping to track flags (0 = not claimed, 1 = claimed)
    mapping(uint256 => uint8) public claimed;

    /// @notice Set the flag for a key
    /// @param key The identifier
    function setClaimed(uint256 key) external {
        claimed[key] = 1;
    }

    /// @notice Check if the key is marked as claimed
    /// @param key The identifier
    /// @return True if claimed
    function isClaimed(uint256 key) external view returns (bool) {
        return claimed[key] == 1;
    }
}
