// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract Event{

    event NameAdded(address addedBy, string name);
    string public name;

    function NameOfSender(string memory _Name)public{
        name = _Name;
        
        emit NameAdded(msg.sender, name);

    }

    


}