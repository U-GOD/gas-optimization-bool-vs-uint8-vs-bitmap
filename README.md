# 🧠 Solidity Gas Optimization: Bool vs Uint8 vs BitMap

This project compares how storing flags (true/false) with different techniques impacts gas usage in Solidity.

We implemented and tested:

- `mapping(uint256 => bool)`
- `mapping(uint256 => uint8)`
- a compact `uint256` bitmap

All contracts perform the same action: marking an ID as claimed and checking its status.

---

## 📦 Contracts

### 1️⃣ BoolMapping.sol
Uses `mapping(uint256 => bool)`  
✅ Simple  
⚠️ Least storage efficient if used for many flags.

### 2️⃣ Uint8MappingFlags.sol
Uses `mapping(uint256 => uint8)` storing 1 or 0  
✅ Slightly clearer storage  
⚠️ Still uses a full slot per entry.

### 3️⃣ BitmapFlags.sol
Uses a `uint256` bitmap (256 flags in 1 slot)  
✅ Most storage-efficient for dense IDs.

---

## 🧪 Gas Usage Comparison

| Operation              | Contract A (`bool`)          | Contract B (`uint8`)         | Contract C (`BitMap`)        |
|------------------------|------------------------------|------------------------------|------------------------------|
| **Raw Gas Used**       | 50,450                       | 50,450                       | 50,356                       |
| **Transaction Cost**   | 43,869                       | 43,869                       | 43,787                       |
| **Execution Cost**     | 22,665                       | 22,665                       | 22,583                       |

✅ **Notes:**
- Measured during `setClaimed()` (A & B) and `setFlag()` (C).
- Gas differences are small for single writes but grow with scale.

---

## 🧩 Observations

- **BitMap** was marginally cheaper per write because it stores multiple flags in one storage slot.
- **Bool and Uint8** mappings had identical gas because each mapping entry uses a full 32-byte slot regardless of the value type.

---

## 🛠️ How to Run

1. Clone this repo.
2. Open [Remix IDE](https://remix.ethereum.org/).
3. Compile and deploy all 3 contracts.
4. Interact with:
   - `setClaimed()` / `setFlag()`
   - `isClaimed()` / `isFlagSet()`
5. Check gas usage in the Remix terminal.

---

## 🎯 Learning Goal

This exercise helps you:

✅ Understand Solidity storage slot behavior.  
✅ Evaluate when bit-packing makes sense.  
✅ Optimize smart contract gas usage for large datasets.

---

