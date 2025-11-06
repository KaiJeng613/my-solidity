// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v5.0/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v5.0/contracts/access/Ownable.sol";

contract PennyPenguinsNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    // 👇 Pass msg.sender to Ownable() as required by OZ v5.x
    constructor() ERC721("PennyPenguinsNFT", "PNY") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    function mintNFT(address recipient, string memory tokenURI)
        public
        onlyOwner
        returns (uint256)
    {
        uint256 newTokenId = tokenCounter;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        tokenCounter++;
        return newTokenId;
    }
}
