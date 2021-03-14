// This was the original skeleton/framework for the contract we ended up making.  Was used to create LoopContract.sol

pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol"; // only works in Remix

contract LoopToken {
    using SafeMath for uint;

    address payable owner = msg.sender;
    address payable requestor;
    address payable recipient;
    uint private amount;
    string public symbol = "LOOP";
    string public reqLoc string;  //location of request on IPFS
    string public category string;

    //uint public exchange_rate = 100;

    mapping(address => uint) balances;

    constructor(address payable _requestor, address payable _provider, _amount) public {
        requestor = _requestor;
        provider = _provider;
        amount = _amount;
    }

    function isValidAmount(uint amount) {
        uint limit = 50;  //to reduce fraud and questionable activity
        if (amount > limit){
            return false;
        } else {
            return true;
        }
    }

    function isComplete(address payable _requestor, address payable _provider){
        require(requestor == _requestor && provider == _provider, "Incorrect addresses");
        return true;
    }

    function balance() public view returns(uint) {
        return balances[msg.sender];
    }

    function getCategory() {
        //Can it get this from the HTML page?
    }

    function transfer(address recipient, uint value) public {
        // using .sub and .add prevents integer underflow
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[recipient] = balances[recipient].add(value);
    }

    function purchase() public payable {
        uint amount = msg.value.mul(exchange_rate);
        balances[msg.sender] = balances[msg.sender].add(amount);
        owner.transfer(msg.value);
    }

    function mint(address recipient, uint value) public {
        require(msg.sender == owner, "You do not have permission to mint tokens!");
        balances[recipient] = balances[recipient].add(value);
    }

    function requestWork(address sender, address receiver, unt amount) public {
        //Function that runs when request is made - can it get this from the html page?
    }

}
