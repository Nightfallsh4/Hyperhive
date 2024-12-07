//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./utils/Errors.sol";
import "./utils/Events.sol";

contract ArtistNFT is ERC721 {
  uint256 public currentTokenId;
  uint256 public limit;
  address artistAddress;

  constructor(
    string memory _artistName,
    string memory _artistSymbol,
    address _artistAddress,
    uint256 _limit
  ) ERC721(_artistName, _artistSymbol) {
    // if (limit == 0) {
    //   revert ArtistNFT_limitCantBeZero();
    // }
    limit = _limit;
    artistAddress = _artistAddress;
  }

  function mintArtistNFT(
    address _to
  ) external {
    currentTokenId++;
    if (currentTokenId > limit) {
      revert ArtistNFT_LimitReached();
    }
    _mint(_to, currentTokenId);
    emit ArtistNFT_MintedArtistNFT(_to, currentTokenId);
  }
}
