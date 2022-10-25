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

    

    // function wihtdraw() {
    // }

}