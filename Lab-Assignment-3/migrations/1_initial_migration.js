const migrations = artifacts.require('Migrations');


module.exports = function deployer(deployer) {
    deployer.deploy(migrations);
};

