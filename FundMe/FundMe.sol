//SPDX-License-Identifier: MIT
 
//Get funds from user, wihtdraw funds from user , and set a min funding value in USD
pragma solidity ^0.8.7;

import "./PriceConverter.sol";

error notOwner();

contract FundMe { 
    using PriceConverter for uint256;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    uint256 public constant MIN_USD = 50 * 1e18 ;

    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() > MIN_USD, "Not enough ether") ;
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function wihtdraw() public onlyOwner {
        
        for(uint256 i=0; i<funders.length; i++){
            address funder = funders[i];
            addressToAmountFunded[funder] = 0;
        }
    
        //rest the array
        funders = new address[](0);
        //three tupes of sending ether - transfer, call and send

        //transfer
        // payable(msg.sender).transfer(address(this).balance); //type casting msg.sender from address type to payable type

        //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        //call.  call function returns two values so enclose the parameters in a parantheses 

        (bool callSuccess , ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }


    //Modifier is a keyword that we can add right in the function declaration to modify the function wiht functionality
    //its like custom functionality for a function

    modifier onlyOwner {
        // require(msg.sender == i_owner, "Sender is not owner");
        //more gas efficient way to check owner is to create a custom eror log

        if(msg.sender != i_owner){
            revert notOwner();
        }
        _;
    } //First execute the modifier then do the rest of the code. The _ represents the rest of the code 
    //If the underscore is above then first do the rest of the code then do the require statement

    //if someone sends eth to this contract without calling the fund function then we use receive() and fallback()

    receive() external payable {
        fund();
    }
    fallback() external payable {
        fund();
    }

}