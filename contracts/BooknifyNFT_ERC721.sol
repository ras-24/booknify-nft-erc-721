// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/access/Ownable.sol";

contract BooknifyNFT is ERC721Enumerable, Ownable {
    uint256 public TokenId;
    string private baseURI;

    constructor() ERC721("Booknify", "BNF") {
        TokenId = 1;
    }

    function mint(address to) public onlyOwner {
        _safeMint(to, TokenId);
        TokenId++;
    }

    function setBaseURI(string memory _baseURI) public onlyOwner {
        baseURI = _baseURI;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "Token does not exist");
        return string(abi.encodePacked(baseURI));
    }
}
