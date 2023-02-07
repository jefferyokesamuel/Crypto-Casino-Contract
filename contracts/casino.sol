pragma solidity ^0.8.0;

contract Casino {
    }

    struct AcceptedBet{
        address sideB;
        uint acceptedAt;
        uint randomB;
    }

    mapping(uint => ProposedBet) public proposedBet;
    mapping(uint => AcceptedBet) public acceptedBet;
}