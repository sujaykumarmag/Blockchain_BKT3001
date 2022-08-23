// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract BalanceSheet{
    address public owner;
    uint public balance;

    constructor(){
        owner=msg.sender;
    }

    /// @notice : A condition to chk the owner is executing the contract
    modifier chk_Owner(){
        require(owner==msg.sender);
        _;
    }

    function getBalance() public chk_Owner returns(uint) {
        balance = owner.balance;
        return balance;
    }
}
