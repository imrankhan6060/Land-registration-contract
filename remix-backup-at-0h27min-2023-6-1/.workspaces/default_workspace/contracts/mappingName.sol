// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract addnameMapping{

    string [] public myarray;

        uint counter;
    mapping(uint => string)public mymapping;

    function addName(string memory name)public{
 
        counter++;
        mymapping[counter] = name;

    }

    function GetAllValue() public returns (string[] memory) {
        
        for (uint i = 1; i <= counter; i++) {
            myarray.push(mymapping[i]);
        }
        return myarray;
    }

}