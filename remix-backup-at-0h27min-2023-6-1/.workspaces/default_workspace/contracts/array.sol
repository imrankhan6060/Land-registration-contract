//SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract arrays{



    uint [] public myarray;
    uint[] public Array;

    function Addarray(uint val)public{
        myarray.push(val);
    }

    function getvalue()public returns(uint[] memory) {

       
        return myarray;
    

    }
   


}