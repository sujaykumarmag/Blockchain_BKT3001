// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract EtherWallet{
    address public owner;

    // events
    event OwnerPrivlege(address _from, address _to, uint ammount);

    // Ether balance
    mapping(address => uint256 ) public BalanceSheet;
    mapping(address =>mapping(address=>uint256))public TransactionLedger;

    constructor(){
        owner = msg.sender;
    }

    modifier chkOwner(){
        require(owner == msg.sender);
        _;
    }

    /// @notice : Withdrawing transaction --> only by owner
    function withdraw(address _payee, address _seller, uint ammount) public chkOwner returns(bool){
        // Check the transaction --> VAlidate it
        require(TransactionLedger[_payee][_seller]==ammount);
        // Take the ammount from seller to payee
        BalanceSheet[_seller] -=ammount;
        BalanceSheet[_payee] +=ammount;
        emit OwnerPrivlege(_seller,_payee,ammount);
        TransactionLedger[_payee][_seller]=ammount;
        return true;
    }

    function sendTransaction(address _from, address _to,uint ammount) public returns(bool){
        require(BalanceSheet[_from]>=ammount);
        BalanceSheet[_from] -=ammount;
        BalanceSheet[_to]+=ammount;
        TransactionLedger[_from][_to]=ammount;
        emit OwnerPrivlege(_from, _to, ammount);
        return true;
    }
}

