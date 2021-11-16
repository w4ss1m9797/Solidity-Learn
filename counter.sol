// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Counter {
    
    // uint POSTIVE INTEGERS ..
    uint count;
    
    constructor() public {
        count = 0;//or we can intiate count ont top without constructor
    }
        
    // view means just read no write ..
    function getCount() public view returns (uint){ // or use count variable as public with this function
        return count;
    }

    // writing data in blockchain as a transaction(record)
    function incrementCount() public {
        count ++;
    }
    
}

