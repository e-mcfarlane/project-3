pragma solidity ^0.5.0;

import "./NewCompanyToken.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";


// Have the NewCompanyToken contract inherit the following OpenZeppelin:
// * Crowdsale
// * CappedCrowdsale
contract NewCompanyTokenCrowdsale is NewCompanyToken, Crowdsale, CappedCrowdsale {    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(
        uint256 rate,
        address payable wallet,
        NewCompanyToken token,
        uint256 cap
    ) 
        public 
        Crowdsale(rate, wallet, token) 
        CappedCrowdsale(cap)
        {
        // constructor can stay empty
    }
}

/*
    // function to sell tokens/shares via funding rounds; 
    //each round will need an (1)assoicated name (e.g. Pre-Seed, Seed, A, etc), (2) price/share, min/max purchase, (3)from list of WL addresses
    function invest() public payable onlyRole(MINTER_ROLE){
        uint256 investRoundSupply = 50000;
        uint256 mintedAmount = mintedAmount + amount;
        require(mintedAmount <= investRoundSupply,"Funding Round Supply Exceeded");
        uint amount = msg.value.mul(exchange_rate);
        balances[msg.sender] = balances[msg.sender].add(amount);
        owner.transfer(msg.value);
    }
*/