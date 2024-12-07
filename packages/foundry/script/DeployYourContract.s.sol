//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "../contracts/ArtistFactory.sol";
import "./DeployHelpers.s.sol";
import { ArtistFactory } from "../contracts/ArtistFactory.sol";
import { ArtistNFT } from "../contracts/ArtistNFT.sol";

contract DeployYourContract is ScaffoldETHDeploy {
  // use `deployer` from `ScaffoldETHDeploy`
  function run() external ScaffoldEthDeployerRunner {
    ArtistFactory artistFactory = new ArtistFactory();
    ArtistNFT artist =
      new ArtistNFT("SHAN", "SH4", deployer, uint256(5));
    console.logString(
      string.concat(
        "ArtistFactory deployed at: ", vm.toString(address(artistFactory))
      )
    );
    console.logString(
      string.concat(
        "ArtistNFT deployed at: ", vm.toString(address(artist))
      )
    );
  }
}
