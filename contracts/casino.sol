pragma solidity ^0.8.0;

contract Casino {
    struct ProposedBet{
        address sideA;
        uint value;
        uint placesAt;
        bool accepted;
    }

    struct AcceptedBet{
        address sideB; // Address of Bet
        uint acceptedAt; // Timestamp 
        uint randomB; 
    }

    mapping(uint => ProposedBet) public proposedBet;
    mapping(uint => AcceptedBet) public acceptedBet;
}