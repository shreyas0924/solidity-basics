//SPDX-License-Identifier: MIT
 
//Get funds from user, wihtdraw funds from user , and set a min funding value in USD
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe { 
    uint256 public minUsd = 50;
    function fund() public payable {
        require(msg.value > minUsd, "Not enough ether") ;

    }

    function getPrice() public { //Get the price of ethereum in terms of usd
        //abi
        //address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e

    }
    // function getConversionRate() public {

    // }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    // function wihtdraw() {
    // }

}