const SurveyPaymaster = artifacts.require("SurveyPaymaster");

module.exports = function (deployer) {
  const relayerReward = 0.1; // Set the desired relayer reward
  deployer.deploy(SurveyPaymaster, relayerReward);
};
