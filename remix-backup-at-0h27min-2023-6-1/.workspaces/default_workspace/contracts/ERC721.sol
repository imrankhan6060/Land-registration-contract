// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BlackHat is ERC721, ERC721Enumerable, ERC721URIStorage, ERC721Burnable, Ownable {
    constructor() ERC721("blackHat", "BH") {}

    uint public tokenIds = 1;
    uint public mintPrice = 2 ether;
    uint public maxSupply = 1;

    function safeMint(address to, string memory uri) public payable
    {
        require(totalSupply() <= maxSupply, "you can't mint more");
        require (msg.value >= 2 ether, "you have to pay price");
        _safeMint(to, tokenIds);
        _setTokenURI(tokenIds, uri);
        tokenIds++;
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
    function withdrow ()public onlyOwner{
  
        payable(owner()).transfer(address(this).balance);
    }
}