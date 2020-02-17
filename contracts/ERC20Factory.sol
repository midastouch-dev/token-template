pragma solidity ^0.5.1;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./MockERC20.sol";

contract ERC20Factory {
  function create(uint256 totalSupply, string calldata name, string calldata symbol, uint8 decimals) external returns (address erc20Address) {
    IERC20 erc20 = new MockERC20(totalSupply, name, symbol, decimals);
    erc20.transfer(msg.sender, erc20.balanceOf(address(this)));
    return address(erc20);
  }
}
