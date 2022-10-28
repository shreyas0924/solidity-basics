// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;


contract enums {
    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function get() public view returns(Status) {
        return status;
    }

    function set(Status _status) public{
        status = _status;
    }

    function cancel() public {
        status = Status.Canceled;
    }
}