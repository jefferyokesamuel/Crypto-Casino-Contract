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

    function proposeBet (uint _commitment) external payable {
        require(proposedBet[_commitment].value == 0, "There is always a bet ");
        require(msg.value > 0, "You need to bet something");
        proposedBet[_commitment].sideA = msg.sender;
        proposedBet[_commitment].value = msg.value;
        proposedBet[_commitment].placedAt = block.timestamp;
        emit BetProposed(_commitment, msg.value);
    }

    function acceptBet(uint _commitment, uint randomValue) external payable {
        require(!proposedBet[_commitment].accepted, "This bet has already been accepted");
        require(proposedBet[_commitment].sideA != address(0), "No one made the Bet");
        require(proposedBet[_commitment].value == msg.value, "Proposed and accepted bets are not the same");
        acceptedBet[_commitment].sideB = msg.sender;
        acceptedBet[_commitment].acceptedAt = block.timestamp;
        acceptedBet[_commitment].randomB = randomValue;
        proposedBet[_commitment].accepted = true;
        emit BetAccepted(_commitment, proposedBet[_commitment].sideA);
    }

    function reveal(uint random) external {
        uint _commitment = uint256(keccak256(abi.encodePacked(random)));
        address payable sideA = payable(msg.sender);
        address payable sideB = payable(acceptedBet[_commitment].sideB);
        uint _agreedRandom = random^acceptedBet[_commitment].randomB;
        uint value = proposedBet[_commitment].value;
        require (proposedBet[_commitment].sideA == msg.sender, "No you havent placed a bet");
        require (proposedBet[_commitment].accepted, "Bet hasnt been accepted");

        if(_agreedRandom % 2 == 0){
            //Side A wins
            sideA.transfer(2*value);
            emit BetSettled(_commitment, sideA, sideB, value);
        } else {
            // Side B wins
            sideB.transfer(2*value);
            emit BetSettled(_commitment, sideB, sideA, value);
        }

        delete proposedBet[_commitment];
        delete acceptedBet[_commitment];
    }
}