//SPDX-License-Identifier: MIT
 
//Get funds from user, wihtdraw funds from user , and set a min funding value in USD
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe { 

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    uint256 public minUsd = 50 * 1e18 ;
    function fund() public payable {
        require(getConversionRate(msg.value) > minUsd, "Not enough ether") ;
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function getPrice() public view returns(uint256) { //Get the price of ethereum in terms of usd
        //abi
        //address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (, int256 price,  , , ) = priceFeed.latestRoundData();
        return uint256(price ** 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18 ;
        return ethAmountInUsd; 
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    // function wihtdraw() {
    // }

}