//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./utils/Errors.sol";
import "./utils/Events.sol";
contract MockUSDC is ERC20 {
    constructor() ERC20("MOCKUSDC","MUSDC"){
        
    }

    function mint(address _to, uint256 _amount)  external {
        _mint(_to,_amount);
    }
}