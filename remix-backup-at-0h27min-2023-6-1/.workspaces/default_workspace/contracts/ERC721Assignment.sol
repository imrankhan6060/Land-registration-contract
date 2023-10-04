// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract IECNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    IERC20 public tokenAddress;
    uint public mintPrice = 0.5 * 10 **18; 

    Counters.Counter private _tokenIdCounter;

    constructor(address _tokenaddress) ERC721("IECNFT", "IEC") {
        tokenAddress = IERC20(_tokenaddress);
            }

    function safeMint() public  {
        tokenAddress.transferFrom(msg.sender, address(this), mintPrice );
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(msg.sender,tokenId);
    }
    
}