const ImanoMarketContract = artifacts.require("ImanoMarketContract");

module.exports = function (deployer) {
  deployer.deploy(ImanoMarketContract);
};
