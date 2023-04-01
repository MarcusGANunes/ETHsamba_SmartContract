// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MeuToken is ERC721 {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string tokenURI = "https://gateway.ipfs.io/ipfs/<hash-da-imagem>";

    constructor() ERC721("cristo_redentor", "cr") {}

    function setTokenURI(uint256 tokenId, string memory tokenURI) public view {
      require(_isApprovedOrOwner(msg.sender, tokenId), "ERC721: caller is not owner nor approved");
      _setTokenURI(tokenId, tokenURI);
    }

    MyToken myToken = MyToken(0x1234567890123456789012345678901234567890);
    uint256 tokenId = 1;

    myToken.setTokenURI(tokenId, tokenURI);

    // function balanceOf(address owner) public view virtual override returns (uint256) {
    //     return ERC721.balanceOf(owner);
    // }

    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        return ERC721.ownerOf(tokenId);
    }

    // function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public virtual override {
    //     ERC721.safeTransferFrom(from, to, tokenId, _data);
    // }

    // function safeTransferFrom(address from, address to, uint256 tokenId) public virtual override {
    //     ERC721.safeTransferFrom(from, to, tokenId);
    // }

    function approve(address to, uint256 tokenId) public virtual override {
        ERC721.approve(to, tokenId);
    }

    function getApproved(uint256 tokenId) public view virtual override returns (address) {
        return ERC721.getApproved(tokenId);
    }

    function setApprovalForAll(address operator, bool approved) public virtual override {
        ERC721.setApprovalForAll(operator, approved);
    }

    function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {
        return ERC721.isApprovedForAll(owner, operator);
    }
}