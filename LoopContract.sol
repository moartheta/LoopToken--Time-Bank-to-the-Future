pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract TimeBank is ERC20, ERC20Detailed {
    
    using SafeMath for uint;
    
    address payable owner;
    address payable requestor;
    address payable provider;
    uint status = 0;
    uint amount;
    uint constant Initiated = 1;
    uint constant Completed = 2;
        
    modifier onlyOwner {
    require(msg.sender == owner, "You do not have permission to mint these tokens!");
    _;
}
    
    constructor(uint initial_supply) ERC20Detailed("LoopToken", "LOOP", 18) public {
        owner = msg.sender;
        _mint(owner, initial_supply);
    }
    
    function mint(address _recipient, uint _amount) public onlyOwner {
        _mint(_recipient, _amount);
    }
    
    function request(uint _amount) public payable {
        requestor = msg.sender;
        amount = _amount;
    }
    
    function initiate() public {
        require(msg.sender != requestor, "Not Authorized to Initiate.  Can't do your own work!" );
        provider = msg.sender;
        status = Initiated;
    }
    
    function complete() public {
        require(msg.sender == provider, "Not Authorized to Mark as Complete!");
        status = Completed;
    }
    
    function signOff() public payable {  
        require(status == Completed, "Sorry, Not Completed Yet!");
        require(msg.sender == requestor, "Not Authoritzed to Sign Off on this Contract");
        transferFrom(requestor, provider, amount);
    }


}