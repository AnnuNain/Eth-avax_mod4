Degevotingcontract
Degveotingcontract is a Solidity smart contract for managing a voting system with tokenized votes (CONT tokens).

Overview
This contract allows for the minting, burning, transferring, and redeeming of voting tokens (CONT). Each voter's balance is tracked on-chain, and the contract owner has privileged access to mint new tokens.

Token Details
Token Name: voter
Token Symbol: VOTE
Features
Minting Votes:
Only the contract owner can mint new votes and allocate them to specific addresses.
Burning Votes:
Voters can burn (destroy) their own votes, reducing the total supply.
Transferring Votes:
Votes can be transferred from one address to another.
Redeeming Votes:
Voters can redeem their votes for rewards based on predefined levels.
Usage
Prerequisites
Ethereum wallet (e.g., MetaMask)
Access to Ethereum network (Mainnet, Ropsten, etc.)
Deployment
Deploy the contract to an Ethereum-compatible blockchain.
Ensure the contract owner initializes the contract with an appropriate balance.
Interacting with the Contract
Mint Votes: mint(address to, uint256 votes)
Burn Votes: burn(uint256 votes)
Transfer Votes: transfer(address to, uint256 votes)
Redeem Votes: redeem(uint256 votes, uint256 rewardLevel)
Check Balance: balanceOf(address account)
