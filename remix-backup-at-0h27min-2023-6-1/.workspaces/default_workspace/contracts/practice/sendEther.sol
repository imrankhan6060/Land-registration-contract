// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract SendEther{

    address public owner;
    mapping (address => uint )public balance;


    constructor(){
        owner = msg.sender;
    }

    modifier onlyowner{
        require(owner == msg.sender, "you are not an Owner");
        _;

    }
    

    
    function SendEthers(address payable _to)public payable onlyowner{
        // require(msg.value <= 3 ether, "you cant send");
        balance[_to] += msg.value;
        require(balance[_to] <= 3 ether , "you excuded the limit"); 
        
        
      
        _to.transfer(msg.value);
      
    }
}