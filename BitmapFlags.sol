// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Bitmap Flags
/// @notice Stores multiple flags in a single uint256 for gas efficiency
contract BitmapFlags {
    /// @notice A single uint256 where each bit represents a flag
    uint256 private flags;

    /// @notice Set the flag for a given index (0 to 255)
    /// @param index The bit position to set
    function setFlag(uint8 index) external {
        require(index < 256, "Index out of bounds");
        flags |= (1 << index);
    }

    /// @notice Check if the flag is set at a given index
    /// @param index The bit position to check
    /// @return True if set, false otherwise
    function isFlagSet(uint8 index) external view returns (bool) {
        require(index < 256, "Index out of bounds");
        return (flags & (1 << index)) != 0;
    }
}