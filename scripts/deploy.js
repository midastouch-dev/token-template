// This script uses @nomiclabs/buidler-truffle5
const ERC20Factory = artifacts.require("ERC20Factory");

async function main() {
  const erc20Factory = await ERC20Factory.new();

  console.log("ERC20Factory address:", erc20Factory.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
