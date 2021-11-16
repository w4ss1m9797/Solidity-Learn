// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyContract {
    
    //state variables
    // stored on blockchain itself 
    int public myInt = 1;
   // uinit can accept negative like -1 
   // and by default uinit is uint256
    string public myString = "hello !";
    bytes32 public myBytes32 = "hello !";
    address public myAddress = 0xF0c9C69c8E4F970dBcd8D79328aF0846B0428200;
    bool public booolT = true;
    // like structure in c
    struct Person {
        uint id;
        string name;
    }
    Person public myStruct = Person(1,"w4ss1m");
    
    //local variables
    function getValue() public pure returns(uint){
        uint value = 1;
        return value;
    }
    
}