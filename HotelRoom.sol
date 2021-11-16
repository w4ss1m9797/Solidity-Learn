// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract HotelRoom {
    
    
    // The presence of the payable modifier means that the function can process transactions with non-zero Ether value. If a transaction that transfers Ether comes to the contract and calls some function X, then if this function X does not have the payable modifier, then the transaction will be rejected
    //The distinction between address and address payable was introduced in Solidity version 0.5. 0. The idea was to make the distinction between addresses that can receive money, and those who can't (used for other purposes). Simply speaking, an address payable can receive Ether, while a plain address cannot.

    address public owner;
    
    enum statuses{Vacant,Occupied}

    
    event Occupy(address occupant, uint value);
    
    statuses currentStatus;
    
    constructor() public {
        owner = msg.sender;
        currentStatus = statuses.Vacant;
    }
    
    modifier onlyWhileVacant{
        require(currentStatus == statuses.Vacant , "Currently Occupied");
        _; // execute require
    }
    
    
    // external − External functions are meant to be called by other contracts. They cannot be used for internal call. ... For public state variable, Solidity automatically creates a getter function. internal − Internal functions/ Variables can only be used internally or by derived contracts.

    receive() external payable onlyWhileVacant {
        // check price
        require(msg.value >= 2 ether , "not enough ether");
        currentStatus = statuses.Occupied;
        payable(owner).transfer(msg.value);
        emit Occupy(msg.sender,msg.value);//After events are called, their arguments are placed in the blockchain
    }


}