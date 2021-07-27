//SPDX-License-Identifier: MIT

pragma solidity 0.8.3;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";
import "./Owned.sol";

contract ModifierExamples is Owned {
    
    using SafeMath for uint;
    
    mapping (address => uint) public tokenBalance;
    
    event TokensSend(address _from, address _to, uint _amount);
    
    uint tokenPrice = 1 ether;
    
    constructor()
    {
        owner = msg.sender;
        tokenBalance[msg.sender] = 100;
    }
    
    
    function createNewToken() public onlyOwner
    {
        tokenBalance[owner]++;
    }
    
    
    function burnToken() public onlyOwner{
        tokenBalance[owner]--;
    }
    
    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }
    
    
    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount);
        tokenBalance[_to] = tokenBalance[_to].add(_amount);
        
        emit TokensSend(msg.sender, _to, _amount);
    }
 }