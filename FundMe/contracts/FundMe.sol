//SPDX-License-Identifier: MIT
 
//Get funds from user, wihtdraw funds from user , and set a min funding value in USD
pragma solidity ^0.8.0;

contract FundMe { 
    uint256 public minUsd = 50;
    function fund() public payable {
        require(msg.value > minUsd, "Not enough ether") ;

    }

    function getPrice() { //Get the price of ethereum in terms of usd


    }
    // function wihtdraw() {
    // }

}