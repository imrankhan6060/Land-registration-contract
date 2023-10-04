// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract const {

    uint  number;
    string public name;

    constructor ( string memory _name){
        name = _name; 

    }

    function addnum(uint _num)public{
        number = _num;
    }
    function getnum()public view returns (uint){
        return number;
    }


}