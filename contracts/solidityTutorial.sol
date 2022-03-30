// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyContract{
    // Hello world, this will be available when deployed
    string public hello_world = "hello world";
    // data types: values and references
    bool public b = true; // boolean, default false
    uint public u = 42; //uint256 (default 0): 0-2**255 (uint8, uint16, ...uint128)
    // int public i = -42; // int256 (default 0)
    int public minInt = type(int).min;
    int public maxInt = type(int).max; 

    // constants are in all caps and save gas when computing
    uint public constant CONST_INT = 42;

    // copied from internet
    address public addr; // default 40 0's
    bytes32 public b32; // default 0's 32 bit byte

    // functions
    function add(uint x, uint y) external pure returns (uint){ 
        //external means exposed
        //pure means not written to blockchain
        return x + y;
    }

    function subtract(uint x, uint y) external pure returns (uint) {
        // need to check x > y
        // if (x > y) {
        //     return x - y;
        // }
        // return 0;
        return (x > y) ? x - y : 0;
    }

    // state variables: saved onto the blockchain
    // declared inside contract, outside of function 
    uint public myUint; // stored on blockchain 
    function setMyUint(uint x) external {
        myUint = x;
    }
    
    // global variables
    function globalVars() external view returns (address, uint, uint) {
        // view can get variables from global and state variables
        address sender = msg.sender; // sender address 
        uint timestamp = block.timestamp; // stores unix timestamp of when fn was called
        uint blockNumber = block.number; // current block number 
        return (sender, timestamp, blockNumber);
    }

    // view vs pure functions 
    // both are readonly
    // view can get data from blockchain
    // pure cannot get data from blockchain 

    function getMyUint() external view returns (uint) {
        return myUint;
    }
    function addToUint(uint x) external view returns (uint) {
        return myUint + x; // does this modify myUint?
    }

    // counter functionality
    uint count; // not sure if we need public or not

    function increaseCount() external {
        count++;
    }
    function decreaseCount() external {
        if (count > 0) {
            count--;
        }
    }
    function getCount() external view returns (uint) {
        return count;
    }

    function loops() external pure {
        for (uint i=0; i < 10; i++){
            // code 
            if (i == 3) {
                continue;
            } // skip executing 3
            // more code
            continue;
        }
        uint j = 0;
        while (j < 10) {
            //code
            j++;
            if (j < 10) {break;}
        }
    }

    function sum(uint _n) external pure returns (uint) {
        // sum up to N
        uint s;
        for (uint i = 0; i <= _n; i++) {
            s += i;
        }
        return s;
    }

}