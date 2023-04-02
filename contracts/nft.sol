// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "hardhat/console.sol";

contract nft is ERC721URIStorage {

    uint256 public nextTokenId = 1;

    string private _name = 'Cristo Redentor';
    string private _symbol = 'RJ';

    constructor() ERC721('JourneyGem', "JGT") {}

    function mint(address to, string memory tokenHash) public {
      uint256 tokenId = nextTokenId;
      _safeMint(to, tokenId);
      _setTokenURI(tokenId, ipfsHashToURI(tokenHash));
      nextTokenId++;
      console.log(tokenURI(tokenId));
    }

    function getBalance(address owner) public view returns (uint256) {
      return balanceOf(owner);
    }
    
    function ipfsHashToURI(string memory ipfsHash) public pure returns (string memory) {
      return string(abi.encodePacked("ipfs://", ipfsHash));
    }

    function deleteToken(uint256 tokenId) public payable {
    _burn(tokenId);
    }
}