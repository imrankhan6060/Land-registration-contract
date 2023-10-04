// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract IECTOKEN is ERC20, ERC20Burnable, Ownable {
    uint public IECTokenPrice = 1 ether;
    uint public buyingLimit = 5;
    mapping(address => uint) public limit;
    constructor() ERC20("IECTOKEN", "IEC") {
        _mint(msg.sender, 10 * 10 ** decimals());
    }
    function mint( uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }
    function buy(uint amount) payable public {
        require(msg.value == 1 ether * amount);
        require(limit[msg.sender] >= buyingLimit , "LIMIT EXCEED");
        require (balanceOf(owner()) >= amount , "you don't have enough balance");
        require (msg.sender != owner() , "owner can not buy token" );
        payable (owner()).transfer(msg.value);
        _transfer(owner(), msg.sender, amount);
        limit[msg.sender] += amount;
    }
    function updatePrice(uint newPrice) public onlyOwner {
    IECTokenPrice = newPrice;
}

}