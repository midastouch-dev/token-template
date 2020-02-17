pragma solidity ^0.5.1;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract MockERC20 is IERC20 {
  using SafeMath for uint256;

  string public name;
  string public symbol;
  uint8 public decimals;
  uint256 public totalSupply;
  mapping(address => uint256) balances;
  mapping(address => mapping(address => uint256)) allowances;

  constructor(uint256 _totalSupply, string memory _name, string memory _symbol, uint8 _decimals) public {
    totalSupply = _totalSupply;
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    balances[msg.sender] = totalSupply;
  }

  function allowance(address owner, address spender) external view returns (uint256) {
    return allowances[owner][spender];
  }

  function balanceOf(address account) external view returns (uint256) {
    return balances[account];
  }

  function transfer(address recipient, uint256 amount) external returns (bool) {
    balances[msg.sender] = balances[msg.sender].sub(amount);
    balances[recipient] = balances[recipient].add(amount);
    emit Transfer(msg.sender, recipient, amount);
    return true;
  }

  function approve(address spender, uint256 amount) external returns (bool) {
    allowances[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return true;
  }

  function mint(address recipient, uint256 amount) external {
    balances[recipient] = balances[recipient].add(amount);
    totalSupply = totalSupply.add(amount);
    emit Mint(recipient, amount);
  }

  function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
    allowances[msg.sender][sender] = allowances[msg.sender][sender].sub(amount);
    balances[sender] = balances[sender].sub(amount);
    balances[recipient] = balances[recipient].add(amount);

    emit Transfer(sender, recipient, amount);
    return true;
  }

  event Transfer(address indexed from, address indexed to, uint256 amount);
  event Approval(address indexed owner, address indexed spender, uint256 amount);
  event Mint(address indexed recipient, uint256 amount);
}
