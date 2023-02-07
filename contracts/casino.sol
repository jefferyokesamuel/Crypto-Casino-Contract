pragma solidity ^0.8.0;

contract Casino {
    struct ProposedBet{
        address sideA; //Address proposing the bet
        uint value; // Valur Proposed
        uint placedAt; // Timestamp 
        bool accepted; // Accepted Boolean
    }

    struct AcceptedBet{
        address sideB; // Address of Bet
        uint acceptedAt; // Timestamp 
        uint randomB; 
    }

    mapping(uint => ProposedBet) public proposedBet;
    mapping(uint => AcceptedBet) public acceptedBet;

    event BetProposed(
        uint indexed _commitment,
        uint value
    );

    event BetAccepted(
        uint indexed _commitment,
        address indexed proposed
    );

    event BetSettled(
        uint indexed _commitment,
        address winner,
        address loser,
        uint value
    );
    
    function proposeBet(uint _commitment) external payable {
        require(proposedBet[_commitment].value == 0, "There is always a bet ");
        require(msg.value > 0, "You need to bet something");
        proposedBet[_commitment].sideA = msg.sender;
        proposedBet[_commitment].value = msg.value;
        proposedBet[_commitment].placedAt = block.timestamp;
        emit BetProposed(_commitment, msg.value);
    }
}