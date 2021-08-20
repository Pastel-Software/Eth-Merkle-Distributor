// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.6.11;
// Allows anyone to claim a token if they exist in a merkle root.
interface IALMMerkleDistributor {
    // Returns the address of the token distributed by this contract.
    function token() external view returns (address);
    // Returns true if the index has been marked claimed.
    function isClaimed(uint256 index, bytes32 merkleRoot_) external view returns (bool);
    // Claim the given amount of the token to the given address. Reverts if the inputs are invalid.
    function claim(uint256 index, address account, uint256 amount, bytes32[] calldata merkleProof, bytes32 merkleRoot_) external;
    // Returns the merkleRoot
    function getMerkleRoot(uint256 epoch_, bytes32 merkleRoot_) external returns (uint256);
    // This event is triggered whenever a call to #claim succeeds.
    event Claimed(uint256 index, address account, uint256 amount);
}