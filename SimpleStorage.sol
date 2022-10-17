//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    uint256 public number; 
    function store(uint256 _number) public {
        number = _number;
    } 

    // view means read the state from this contract

    function retrieve() public view returns(uint256){
        return number;
    } 

    //retrieve is just reading the number
    // We cannot update the blockchain with a view function

    //Pure functions does not allow you to read the state from the blockchain ex. we cannot read "number" if we use pure as keyword 
    // Pure is used to write specific code whch is only called and not read
    function add() public pure returns(uint256) {
        return (1 + 1);
    }

    //We dont spend gas if we use pure or view functions
    //We spend gas only if there is a change in state in the blockchain
    
}