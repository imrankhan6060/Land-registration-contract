// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract Wallet{


    address owner;
    uint public balance;
    bool isvarifired;

    mapping (address => user) public Users;
    mapping(address => bool) isUservarified;

    struct user{
        uint Id;
        string name;
        uint balance;
        bool kyoc;
    }
    
    constructor (){
        owner = msg.sender; 

    }
    modifier onlyowner{
        require (msg.sender == owner, "you are not and owner");
        _;
    }

    function AddUser(uint _id, string memory _name, uint _balance, address addr) public{
        Users[addr].Id = _id;
        Users[addr].name = _name;
        Users[addr].balance = _balance;
        Users[addr].kyoc = false;
    }
    function KYOC(address userId) public onlyowner{
        Users[userId].kyoc = true ;

    }
    
    function Deposit() public payable{
        require (Users[msg.sender].kyoc, "Not APPROVE");
        balance +=msg.value; 
    } 

    function Withdraw(uint amount)public payable{
        require (Users[msg.sender].kyoc, "Not APPROVE");
        require (amount <= balance,"you do not have enough balance");
        
        (bool sent, bytes memory data) =(msg.sender.call{value:amount,gas:2000}(""));
        data = data;
        require (sent, "transsaction failed");
    }


}