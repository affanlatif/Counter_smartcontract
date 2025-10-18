// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    // State variable to store the counter value
    int public count; // using int so we can go below 0 if decremented

    // Function to increment the counter
    function increment() public {
        count += 1;
    }

    // Function to decrement the counter
    function decrement() public {
        count -= 1;
    }

    // Function to get the current counter value (optional, since 'count' is public)
    function getCount() public view returns (int) {
        return count;
    }
}

