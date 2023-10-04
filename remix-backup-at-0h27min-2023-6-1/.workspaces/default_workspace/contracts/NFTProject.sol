// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTFriends is ERC721, ERC721Enumerable, Pausable, Ownable {
    using Counters for Counters.Counter;
    uint public maxSupply; 
    uint public maxMintLimint;
    uint public platformLimit;
    uint public userLimit;
    uint public allowlistLimit;
    bool allowlistmintopen = false;
    bool publicMintOpen = false;
    mapping (address => bool) allowlist;
    mapping (address => uint )addressTokenCount;
   


    Counters.Counter private _tokenIdCounter;

    constructor(uint _maxSupply, uint _platformLimit) ERC721("NFTFriends", "NFTF") {
        maxSupply = _maxSupply;
        platformLimit= _platformLimit;
        userLimit = _maxSupply - _platformLimit;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }
    //modify the mint window
    function editMintWindow(bool _allowlistmintopen, bool _publicMintOpen )external onlyOwner{
        publicMintOpen = _publicMintOpen;
        allowlistmintopen = _allowlistmintopen;

    }
    //Allowlist mint or premium member
    
    function AllowlistMint() public  payable{
        
        require(allowlist[msg.sender],"you are not in allowlist");
        require(allowlistmintopen,"Allowlist mint close");
      //  require(msg.value == 0.05 ether ,"don't have enough funds" );
        require(addressTokenCount[msg.sender] < maxMintLimint, "Address has already minted an NFT");
        allowlistLimit++;
        internalMint();
    }
    //populate the allowlist or premium member
    function setAllowlist(address[] calldata adresses) external onlyOwner{
        for (uint256 i =0 ; i < adresses.length ; i++){
            allowlist[adresses[i]] = true; 
        }
    }
    // public mint or normal user mint
    function publicMint() public payable {
    require(publicMintOpen, "Public mint closed");
    require(addressTokenCount[msg.sender] < maxMintLimint, "Address has already minted an NFT");
    internalMint();
    }

    // globel user mint limint
    function mintLimit (uint limit)public onlyOwner{
         maxMintLimint = limit;
    }









    function internalMint()internal {
        uint256 tokenId = _tokenIdCounter.current();
         require(totalSupply() < maxSupply,"sold out");
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
        addressTokenCount[msg.sender]++;
        
    }

    function withdrow(address _addr)external onlyOwner{
        uint256 balances = address(this).balance;
        payable (_addr).transfer(balances);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}