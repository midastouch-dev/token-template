module.exports = (deployer) => {
  const deploy = (name) => deployer.deploy(artifacts.require(name));

  ['Migrations', 'ERC20Factory'].forEach(deploy);
};
