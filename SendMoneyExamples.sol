// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract SendMoneyExample {
    
    uint public balanceReceived;
    
    bool paused;
    
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, 'He');
        paused = _paused;
    }
    
    
    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function withdrawMoney() public {
        address payable to = payable(msg.sender);
        
        to.transfer(this.getBalance());
    }
    
    function withdrawMoneyTo(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        _to.transfer(this.getBalance());

    }
}