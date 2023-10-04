// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;
import "@openzeppelin/contracts/access/Ownable.sol";
contract openzipline is Ownable {
    uint public num;

    function setA( uint _num)public onlyOwner {
        num =_num;
    }
}