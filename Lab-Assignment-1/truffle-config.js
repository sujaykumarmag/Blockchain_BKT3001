require('babel-register');
require('babel-polyfill');

module.exports = {
    networks: {
        development: {
            host: '127.0.0.1',
            port: '7545',
            network_id: '*' // Connect to any network
        }
    },
    contracts_directory: './src/contracts/',
    contracts
}
