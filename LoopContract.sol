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
    
    // Call the internal `_mint` function and pass the `recipient` and `amount` variables.
    function mint(address _recipient, uint _amount) public onlyOwner {
        _mint(_recipient, _amount);
    }
    
    // Initializes the requestors contract for work with a specified hour (LOOP) amount.
    function request(uint _amount) public payable {
        requestor = msg.sender; // Setting requestor contract address.
        amount = _amount; // Setting the amount to number of hours (LOOP) requested.
    }
    
    // Provider accepts request for work function from above.
    function initiate() public {
        require(msg.sender != requestor, "Not Authorized to Initiate.  Can't do your own work!" ); // Checks to make sure the requestor and requestee are not the same person.
        provider = msg.sender; // Setting provider contract address.
        status = Initiated; // Setting status to initiated.
    }
    
    // Provider marks complete when the work is done.
    function complete() public {
        require(msg.sender == provider, "Not Authorized to Mark as Complete!"); // Requires that person marking complete is the one who Initiated the contract .
        status = Completed; // Setting status to completed.
    }
    
    // Requestor signs off and verifies that work has been completed to release funds to the provider.
    function signOff() public payable {  
        require(status == Completed, "Sorry, Not Completed Yet!"); // Checks that the status of the work is completed.
        require(msg.sender == requestor, "Not Authoritzed to Sign Off on this Contract"); // Checks to make sure the requestor and not the provider signs off.
        transferFrom(requestor, provider, amount); // Transfers funds from requestor to provider.
    }


}
