// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract statevariable {

    uint public age;

    function setage(uint _age)public {
        age = _age;
    }
    
    function getage()public view returns(uint){
        return age;
    }

}