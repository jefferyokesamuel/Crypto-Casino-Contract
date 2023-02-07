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
}