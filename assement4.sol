// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EventParticipationToken {
    string public name = "EventParticipation";
    string public symbol = "EPT";
    uint256 public totalSupply;
    address public organizer;
    
    mapping(address => uint256) public balances;

    constructor() {
        organizer = msg.sender;
    }

    // Mint new event participation tokens
    function mint(address to, uint256 tokens) public {
        require(msg.sender == organizer, "Only the organizer can mint tokens.");
        require(tokens > 0, "Tokens must be greater than 0.");
        balances[to] += tokens;
        totalSupply += tokens;
    }

    // Transfer tokens between participants
    function transfer(address to, uint256 tokens) public {
        require(balances[msg.sender] >= tokens, "Not enough tokens.");
        require(to != address(0), "Cannot transfer to zero address.");
        balances[msg.sender] -= tokens;
        balances[to] += tokens;
    }

    // Burn tokens from a participant's balance
    function burn(uint256 tokens) public {
        require(balances[msg.sender] >= tokens, "Not enough tokens to burn.");
        balances[msg.sender] -= tokens;
        totalSupply -= tokens;
    }

    // Redeem tokens based on event tiers
    function redeem(uint256 tokens, uint8 eventTier) public {
        require(balances[msg.sender] >= tokens, "Not enough tokens to redeem.");
        if (eventTier == 1) {
            require(tokens >= 10, "Insufficient tokens for Tier 1 event.");
            burn(tokens);
        } else if (eventTier == 2) {
            require(tokens >= 50, "Insufficient tokens for Tier 2 event.");
            burn(tokens);
        } else if (eventTier == 3) {
            require(tokens >= 100, "Insufficient tokens for Tier 3 event.");
            burn(tokens);
        } else {
            revert("Invalid event tier.");
        }
    }

    // Check the balance of a participant
    function checkBalance(address account) public view returns (uint256) {
        return balances[account];
    }
}
