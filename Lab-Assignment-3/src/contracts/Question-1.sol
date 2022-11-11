// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract FunctionOverload{
    address public owner;
    uint256 public num;
    constructor(){
        owner=msg.sender;
    }

    /// @notice : Function is with the same name
    /// @dev : The Function Overloading refers to the functions which plays the different roles in a smart contract
    function one(uint256 a,uint256 b) public returns(uint256){
        num=a*b;
        return num;
    }

    function one(uint256 a)public returns(uint256){
        num=a^2;
        return num;
    }
}