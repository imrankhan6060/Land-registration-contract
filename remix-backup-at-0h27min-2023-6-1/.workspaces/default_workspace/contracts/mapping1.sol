// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract mapping1{


    uint public keycounter;
    uint [] public myarray;
 
    struct student{
        string name;
        uint rollno;
        string uni;
        address account;   
    }

    mapping (uint => student )public mymapping;

    function addData
    (
        string memory _name,
        uint _rollno,
        string memory _uni,
        address _acount
        )
        public
        {

            mymapping[keycounter] = student(_name, _rollno,_uni,_acount);
       
    }

    function GetAllName()public returns(string []memory){


        for (uint i = 1; i<=keycounter; i++ ){
            myarray.push(mymapping[i]);
        }
        return myarray;
    }

    
  /*  function deleteData(uint key )public{
        delete mymapping[key];
    }
    */

}

