// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract mapping1{


    uint public counter;
    uint []public myarray;
 
    struct student{
        string name;
        uint rollno;
        string uni;
        address account;   
    }

    mapping (uint => student )public mymapping;

    function addData
    (
        uint key,
        string memory _name,
        uint _rollno,
        string memory _uni,
        address _acount
        )
        public
        {

            mymapping[key].name = _name;
            mymapping[key].rollno = _rollno;
            mymapping[key].uni = _uni;
            mymapping[key].account = _acount;
       
    }

    function GetAllName()public{

    
        uint length = mymapping.length;

        for (uint i = 0; i<=length; i++ ){
            myarray.push(mymapping[i]);
        }
    }

    
  /*  function deleteData(uint key )public{
        delete mymapping[key];
    }
    */

}

