# 🐻 BearCoin – A Tiny Blockchain in C

![BearCoin](./assets/bearcoin.PNG)

**BearCoin** is a reference blockchain implemented in C and Python with ultra-low proof-of-work, SHA256 hashing, RSA-signed transactions, and a GitHub Actions-powered miner that mines a new block daily.

---

## 📁 Project Structure

- `block/` – Mined blocks (e.g. `block_00.bin`, `block_01.bin`, ...)
- `block_transactions/` – Transaction batches and Merkle trees per block
- `sha.c`, `rsa.c`, `merkle.c` – Core blockchain tools (SHA, RSA, Merkle)
- `mine_new_block.py` – Python script to parse, mine, verify, and store blocks
- `create_genesis_block.py` – Initializes the genesis block
- `verify_block.c` – Validates blocks using the proof-of-work rules
- `Makefile` – Builds all required C binaries
- `.github/workflows/` – CI/CD configuration for automated mining

---

## ⚙️ Setup Instructions

### Dependencies

Make sure these are installed on your system:

```bash
gcc
libssl-dev
libgmp-dev
python3
```

### ⛏️ Mining Workflow

The mine_new_block.py script:

Alternates between transaction groups (t_00 and t_01)

Signs each transaction with RSA

Builds a Merkle tree and root

Hashes the block

Mines until a valid nonce is found

Verifies block using verify_block

Writes the block to block/block_XX.bin

Commits changes via GitHub Actions

### 🔁 GitHub Actions: Daily Mining

GitHub Actions runs once per day using a cron job:

Scheduled mining at midnight UTC

Git auto-commits the mined block and transaction batch

Pushes to main using a GitHub PAT (GH_PAT)

The CI/CD pipeline is defined in .github/workflows/mine.yml.

### 🔐 Security & Verification

Transactions are RSA-signed using 2048-bit keys

Each transaction includes:

text

signature length

signature

The block verifier checks that the block hash starts with a 0x00 byte (difficulty = 1)

verify_transaction.py can be used to verify transaction signatures stored in block_transactions/

- recomputing the transaction hash and comparing it against the public key decrypted signature

block_explorer.py can be used to output block contents in human readable format

### 🧪 Example Output

```bash
python3 block_explorer.py block/block_03.bin
```

📦 Block File: block_03.bin
├─ Previous Hash: ...
├─ Merkle Root: ...
├─ Difficulty: 1
├─ Timestamp: 1714531200
├─ Nonce: 287
├─ Transactions: 3
└─ Contents:
[0] 'Bear pays Shadow 50 coins'
Signature (240 bytes): abc123...

### 🧠 Design Notes

Blocks are stored individually as binaries

Low proof-of-work (PoW) avoids triggering GitHub’s anti-crypto mining filters

Future blocks are mined based on prior block hashes and transaction content

🐾 About
BearCoin is a playful but functional microchain project built for educational purposes and CI/CD experimentation.

It leverages SHA256, RSA, and Merkle Trees written in C, with real-time mining automation.

© 2025 BearCoin 🐻 Built with C, Python, and lots of frustration....
