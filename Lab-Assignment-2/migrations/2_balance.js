const balance = artifacts.require('BalanceSheet');
const subcurrency = artifacts.require('SubCurrency');
const etherwallet = artifacts.require('EtherWallet');

module.exports = function deployer(deployer) {
    deployer.deploy(balance);
    deployer.deploy(subcurrency);
    deployer.deploy(etherwallet);
}