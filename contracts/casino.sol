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
}