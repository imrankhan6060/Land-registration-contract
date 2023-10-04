// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;


contract OwnerOnly {
    address public owner;

    constructor() {
        owner = (msg.sender);
    }

    modifier onlyOwners {
        require(msg.sender == owner, "you are not an owner.");
        _;
    }

    function sendEther(address payable recipient) external onlyOwners payable {
        require(msg.value <= 3 ether, "you can not send more than 3 ether.");
        recipient.transfer(msg.value);
    }
}
    
