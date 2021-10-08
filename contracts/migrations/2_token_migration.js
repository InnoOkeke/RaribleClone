const ImanoToken = artifacts.require("ImanoToken");

module.exports = function (deployer) {
  deployer.deploy(ImanoToken);
};
