// migrations/1_deploy.js
const LandContract = artifacts.require('LandContract');

module.exports = async function (deployer) {
    await deployer.deploy(LandContract);
};