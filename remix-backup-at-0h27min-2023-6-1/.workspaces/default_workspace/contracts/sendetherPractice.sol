// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract transfer{


    bytes public data;


    // jis fuction ko  eth bhej rhe hoga wo payable hoga

    function transferFun(address payable _addr) public payable{
        _addr.transfer(msg.value);
    }

    // send method mai bool return kare ga. 

    function sendEtherBySend(address payable _to)public payable{
        
       bool sent =_to.send(msg.value); 
       require( sent, "failed to transfer Ether");
    }

    // call function
    // bools of bytes dono return hogi. 

    function SendEtherByCall(address payable to)public payable{
        (bool success, bytes memory _data) = to.call{value:msg.value, gas:2000}("");
        data = _data;
        require (success, "Failed to transfer");
    }


}