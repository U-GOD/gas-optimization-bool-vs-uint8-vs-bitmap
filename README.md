# 🧠 Solidity Gas Optimization: Bool vs Uint8 vs BitMap

This project demonstrates how storing flags (true/false) using different techniques impacts gas usage. It compares three smart contracts that use:

- `bool` mapping
- `uint8` mapping
- a compact `uint256` bitmap

All contracts perform the same task: marking an ID or index as “claimed” and checking its status.

---

## 📦 Contracts

### 1️⃣ `BoolMapping.sol`
- Uses `mapping(uint256 => bool)`.
- Each key maps directly to a `bool`.
- Gas-inefficient due to Solidity's internal padding and storage slot behavior.

### 2️⃣ `Uint8MappingFlags.sol`
- Uses `mapping(uint256 => uint8)`.
- Stores the flag as a `1` or `0` instead of `true`/`false`.
- Slight improvement in gas cost and can help avoid some padding inefficiencies.

### 3️⃣ `BitmapFlags.sol`
- Uses a single `uint256` to represent 256 flags.
- Each bit corresponds to one index (0–255).
- Offers **major savings** in storage for bulk operations or dense sets of flags.

---

## 🧪 Gas Usage Comparison

| Operation         | Contract A (`bool`) | Contract B (`uint8`) | Contract C (`BitMap`) |
|------------------|---------------------|-----------------------|------------------------|
| `setClaimed()`   | Transaction: 43,869  
Execution: 22,665 | Transaction: 43,869  
Execution: 22,665 | Transaction: **43,787**  
Execution: **22,583** |

> ⛽️ *Measured during call to mark a single ID/index as claimed.*

---

## 🧩 Observations

- **Gas Difference:**  
  BitMap (Contract C) uses **less gas** than both bool and uint8 mappings.

- **Why?**  
  BitMap packs all flags into a single storage slot (32 bytes = 256 bits), making it highly storage-efficient.

- **Use Case Fit:**  
  - ✅ Use `bool` or `uint8` if you have sparse or non-sequential IDs.
  - ✅ Use `BitMap` when you're flagging a dense and known range (like IDs 0–255).

---

## 🛠️ How to Run

1. Clone the repo and open in [Remix IDE](https://remix.ethereum.org/).
2. Deploy each contract.
3. Call:
   - `setClaimed()` or `setFlag()` with a value like `1`.
   - `isClaimed()` or `isFlagSet()` to check status.
4. Observe the gas usage in the Remix terminal.

---

## 🎯 Learning Goal

Understand how different storage strategies affect gas costs in Solidity. This helps you:

- Write more efficient smart contracts.
- Choose the right storage approach for your use case.
- Build the foundation for advanced audit-level optimization.

---
