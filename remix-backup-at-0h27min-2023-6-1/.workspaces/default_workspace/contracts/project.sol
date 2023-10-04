// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract BlackHat is ERC721, ERC721Enumerable, ERC721URIStorage, ERC721Burnable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    uint public maxSupply; 
    uint public maxMintLimint;
    uint public platformLimit;
    uint public userLimit;
    uint public allowlistLimit;
    bool allowlistmintopen = false;
    bool publicMintOpen = false;
    mapping (address => bool) allowlist;
    mapping (address => uint ) addressTokenCount;

    constructor(uint _maxSupply, uint _platformLimit) ERC721("NFTFriends", "NFTF") {
        maxSupply = _maxSupply;
        platformLimit = _platformLimit;
        userLimit = _maxSupply - _platformLimit;
    }

    //allowlist mint

    function AllowlistMint(address to, string memory uri) public payable {
        require(totalSupply() <= maxSupply, "you can't mint more");
        require(msg.value >= 2 ether, "you have to pay the price");
        _safeMint(to, _tokenIdCounter.current());
        _setTokenURI(_tokenIdCounter.current(), uri);
        _tokenIdCounter.increment();
    }
     function setAllowlist(address[] calldata adresses) external onlyOwner{
        for (uint256 i =0 ; i < adresses.length ; i++){
            allowlist[adresses[i]] = true; 
        }
    
    //public mint

    function publicMint (address to, string memory uri) public payable {
        require(totalSupply() <= maxSupply, "you can't mint more");
        require(msg.value >= 2 ether, "you have to pay the price");
        _safeMint(to, _tokenIdCounter.current());
        _setTokenURI(_tokenIdCounter.current(), uri);
        _tokenIdCounter.increment();
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

    function withdraw() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}