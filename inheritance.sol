// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Ownable {
    
    address owner;


  
    constructor() public {
        owner = msg.sender;
        
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner , 'must be owner');
        _;
    }
}

contract SecretVault {
    string secret;

    
    constructor(string memory _secret) public {
        secret = _secret;
    }
    
    
    function getSecret() public view returns (string memory){
        return secret;
    }
 
 
}
contract MyContract is Ownable{
 
    address secretVault;

    
    constructor(string memory _secret) public {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }
    
    
    function getSecret() public view onlyOwner returns (string memory){
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getSecret();
    }
 
    
}

// onlyOwener access basic impplementation
//contract MyContract3 {
 
    string secret;
    address owner;
    
    modifier onlyOwner(){
        require(msg.sender == owner , 'must be owner');
        _;
    }
    
    constructor(string memory _secret) public {
        secret = _secret;
        owner = msg.sender;
        
    }
    
    
    function getSecret() public view onlyOwner returns (string memory){
        return secret;
    }
 
    
}