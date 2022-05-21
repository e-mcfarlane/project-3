pragma solidity ^0.8.4;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";


contract ExChain is ERC20, Ownable, ERC20Permit, ERC20Votes {
    address payable owner = msg.sender;
    constructor() ERC20("ExChainToken", "EXT") ERC20Permit("ExChainToken") {}
        _mint(msg.sender, 1000000);

    modifier onlyOwner(uint _level, uint _zombieId) {
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
    function employeeShareGrant(uint256 vestingTime, uint256 amount, address to) public onlyOwner {
        uint256 vestAmount = amount / vestingTime;
        for(uint i = 1; i > vestingTime; i++){
            TokenTimelock(ERC20Basic _token, to, now + (i * 1) years))
        }
        
    };


    // function to sell shares via funding rounds; 
    //each round will need an (1)assoicated name (e.g. Pre-Seed, Seed, A, etc), (2) price/share, min/max purchase, (3)from list of WL addresses



    // function to "whitelist" approved investors
    function addToWhitelist(address member) public onlyRole(DEFAULT_ADMIN_ROLE) {
        _grantRole(MINTER_ROLE, member);
    }


    // function to calculate available supply "float" of shares to see if shares are available to issue (= balance of "owner" account??)