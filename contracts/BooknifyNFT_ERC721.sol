// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/access/Ownable.sol";

contract BooknifyNFT is ERC721, Ownable {
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
}