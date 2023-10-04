// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.18;

contract statevariable {

    uint public age;

    function setage(uint _age)public {
        age = _age;
    }
    
    function getage()public view returns(uint){
        return age;
    }

}

contract bank{

    uint internal balance;

    function addbalance(uint amount)public {
        balance = balance + amount;
    }
    
    function getbalance()public view returns(uint){
        return balance;
    }

}