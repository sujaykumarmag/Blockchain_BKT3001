// SPDX-License-Identifier: GPL-3.0

// Importing Solidity
pragma solidity ^0.8.3;

contract Migrations{
    address public owner;
    uint public last_completed_migration;

    constructor (){
        owner=msg.sender;
    }

    // Modifier to check if the owner is legit
    modifier chkOwner() {
        require(msg.sender==owner);
        _;
    }

    function setCompleted(uint completed) public chkOwner{
        last_completed_migration=completed;
    }

    function upgrade(address new_address) public chkOwner{
        Migrations migrate = Migrations(new_address);
        migrate.setCompleted(last_completed_migration);
    }
}


