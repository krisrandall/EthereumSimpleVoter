pragma solidity ^0.4.18;

contract SimpleVoter {
    
    mapping( address => bool ) hasVoted;
    uint256 public yeses;
    uint256 public nos;
    
    function castVote( bool _vote ) public {
        
        assert( hasVoted[msg.sender] != true );
        
        if (_vote) {
            yeses++;
        } else {
            nos++;
        }
        hasVoted[msg.sender] = true;
        
    }
    
}