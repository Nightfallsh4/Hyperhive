//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import { ArtistNFT } from "./ArtistNFT.sol";

contract ArtistFactory {
  constructor() { }

  function createArtistNFT(
    address _artistAddress,
    uint256 limit,
    string memory _artistName,
    string memory _artistSymbol
  ) external returns (ArtistNFT) {
    ArtistNFT artist =
      new ArtistNFT(_artistName, _artistSymbol, _artistAddress, limit);
    return artist;
  }
}
