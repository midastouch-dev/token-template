// This script uses @nomiclabs/buidler-truffle5
const ERC20Factory = artifacts.require("ERC20Factory");
const fs = require('fs')

async function main() {
  const erc20Factory = await ERC20Factory.new();

  fs.writeFileSync('addresses.json', JSON.stringify({
    erc20Factory: erc20Factory.address
  }))
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
