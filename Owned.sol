//SPDX-License-Identifier: MIT

pragma solidity 0.8.3;


contract Owned {
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(owner == msg.sender, 'You are not allowed.');
        _;
    }
}