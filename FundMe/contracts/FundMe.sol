//SPDX-License-Identifier: MIT
 
//Get funds from user, wihtdraw funds from user , and set a min funding value in USD
pragma solidity ^0.8.7;

import "./PriceConverter.sol";


contract FundMe { 
    using PriceConverter for uint256;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    uint256 public minUsd = 50 * 1e18 ;
    function fund() public payable {
        require(msg.value.getConversionRate() > minUsd, "Not enough ether") ;
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function wihtdraw() {
        for(uint256 i=0; i<funders.length; i++){
            address funder = funders[i];
            addressToAmountFunded[funder] = 0;
        }
    }

   //reset the array
    funders = new address[](0);
    
    //transfer
    payable(msg.sender).transfer(address(this).balance); //type casting msg.sender from address type to payable type
}