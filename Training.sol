// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract WorkingWithVariables {
    uint256 public myUnit;
    
    function setMyUint(uint _myUnit) public {
        myUnit = _myUnit;
    }
    
    bool public myBool;
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    uint8 public myUnit8;
    
    function incrementUnit() public {
        myUnit8++;
    }
    
    function decrementUnit() public {
        myUnit8--;
    }
    
    address public myAddress;
    
    function setAddress(address _address) public {
        myAddress = _address;
    }
    
    function getBalanceOfAddress() public view returns(uint) {
        return myAddress.balance;
    }
    
    string public myString = 'hello word';
    
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}