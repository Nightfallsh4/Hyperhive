//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "./DeployHelpers.s.sol";
import { ArtistFactory } from "src/ArtistFactory.sol";
import { ArtistNFT } from "src/ArtistNFT.sol";
import { ART } from "src/ART.sol";
import { Staking } from "src/Staking.sol";
contract DeployYourContract is ScaffoldETHDeploy {
  // use `deployer` from `ScaffoldETHDeploy`
  function run() external ScaffoldEthDeployerRunner {
    ArtistFactory artistFactory = new ArtistFactory();
    ArtistNFT artist =
      new ArtistNFT("SHAN", "SH4", deployer, uint256(5));
    ART art = new ART();
    Staking staking = new Staking(1 days, );
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
