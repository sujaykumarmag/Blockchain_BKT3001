// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract SubCurrency{
    address public owner;
    uint256 ammount = 1000000000000000000000;   // 1000 ETher minting

    mapping(address=>uint256) BalanceSheet;
    event Transaction(address _from, address _to, uint256 amount);

    constructor(){
        owner= msg.sender;
        BalanceSheet[owner]=ammount;

    }

    function mint(address _receiver, uint amount) public {
        require(BalanceSheet[owner]>=ammount);
        BalanceSheet[_receiver] +=ammount;
        BalanceSheet[owner] -=ammount;
        emit Transaction(msg.sender,_receiver,amount);
    }

    function send(address from, address to, uint amount)public{
        require(BalanceSheet[from]>=amount);
        BalanceSheet[from]-=amount;
        BalanceSheet[to]+=amount;
        emit Transaction(from, to, amount);
    }
}