pragma solidity ^0.8.4;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";


contract NewCompanyToken is ERC20, Ownable, ERC20Permit, ERC20Votes, AccessControl, TokenTimelock {
    address payable owner = msg.sender;
    uint256 exchange_rate;


    constructor() ERC20("NewCompanyToken", "NCT") ERC20Permit("NewCompanyToken") {}
        _mint(msg.sender, 1000000);

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    // function to issue(mint) new shares, callable only by owner
    function mint(address to, uint256 amount) public onlyOwner{
        require(to == owner,"You are not minting to the corporate account");
        _mint(to, amount);
    }

    // function to grant shares to employees, need to have "vesting" period where if doesn't reach "X years" reverts to Owner
    // Q: Can this be modified to do 1000s at a time??
    // Q: HOW TO do vesting??
    function employeeShareGrant(uint256 vestingTime, uint256 amount, address to) public onlyOwner{
        uint256 vestAmount = amount / vestingTime;
        for(uint i = 1; i > vestingTime; i++){
            TokenTimelock(ERC20Basic _token, to, now + (i * 1) years))
        }
        
    };

    // function to "whitelist" approved investors
    function addToWhitelist(address member) public onlyOwner{
        _grantRole(MINTER_ROLE, member);
    }
}