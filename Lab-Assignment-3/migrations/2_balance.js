const functionOverload = artifacts.require('FunctionOverload');
//const subcurrency = artifacts.require('SubCurrency');
//const etherwallet = artifacts.require('EtherWallet');

module.exports = function deployer(deployer) {
    deployer.deploy(functionOverload);
}