// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Bool Mapping Example
/// @notice Stores a mapping of uint256 IDs to bool flags
contract BoolMapping {
    /// @notice Mapping of ID => bool flag
    mapping(uint256 => bool) public  hasClaimed;

    /// @notice Marks the given ID as claimed
    /// @param id The ID to set
    function setClaimed(uint256 id) external {
        hasClaimed[id] = true;
    }

    /// @notice Checks whether the ID was claimed
    /// @param id The ID to check
    /// @return True if claimed, false otherwise
    function isClaimed(uint256 id) external view returns (bool) {
        return hasClaimed[id];
    }
}