// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";


contract nft is ERC721URIStorage, Ownable {
    uint256 public nextTokenId = 1;

    constructor() ERC721("nft", "N") {}

    function mint(address to, string memory tokenURI) public onlyOwner {
        uint256 tokenId = nextTokenId;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        nextTokenId++;
    }

    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        return ERC721.ownerOf(tokenId);
    }
    
    function ipfsHashToURI(string memory ipfsHash) public pure returns (string memory) {
        return string(abi.encodePacked("https://ipfs.io/ipfs/", ipfsHash));
    }

    function deleteToken(uint256 tokenId) public onlyOwner {
        _burn(tokenId);
    }
}