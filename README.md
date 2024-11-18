## Smart Contract

A simple Solidity contract that allows setting a state value with validation and performing safe division between two numbers. It ensures the new value is positive and different from the current one, and that division operations are only performed when the denominator is non-zero and divisible.

## Description
This contract provides basic functionality to interact with a state variable value and includes two key functions:

setValue: Allows you to set a new value for the state variable value. It ensures that the new value is different from the current one and that it is greater than zero.

performDivision: Performs a division operation between two unsigned integers (_numerator and _denominator). It checks to ensure that the denominator is not zero and that the numerator is divisible by the denominator before performing the division.

## Getting Started
### Executing Program
To run this program, you can use Remix, an online IDE for Solidity development. Follow the steps below to execute the program:

Visit the Remix IDE website at Remix Ethereum.
Create a new file by clicking on the "+" icon in the left-hand sidebar, and save the file with a .sol extension (e.g., smart-Contract.sol).
Copy and paste the following code into your new file:
```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract UniqueErrorHandler {
    uint public trackedValue;

    // Updates the tracked value if conditions are met
    function changeTrackedValue(uint newValue) public {
        require(isPositive(newValue), "Provided value must be positive.");
        require(newValue != trackedValue, "The new value must differ from the tracked value.");
        
        trackedValue = newValue;

        // Assert to ensure that the tracked value is updated correctly
        assert(trackedValue == newValue);
    }

    // Performs division safely, ensuring it meets conditions
    function calculateDivision(uint numerator, uint denominator) public pure returns (uint) {
        require(denominator > 0, "Denominator cannot be zero.");

        // Check divisibility using a helper function
        if (!isDivisible(numerator, denominator)) {
            revert("Numerator must be divisible by denominator.");
        }

        return numerator / denominator;
    }

    // Helper function to check if a number is positive
    function isPositive(uint value) private pure returns (bool) {
        return value > 0;
    }

    // Helper function to check divisibility
    function isDivisible(uint numerator, uint denominator) private pure returns (bool) {
        return numerator % denominator == 0;
    }
}
```

To compile the code, go to the "Solidity Compiler" tab in the left-hand sidebar. Set the "Compiler" version to 0.8.18, then click on the "Compile myToken.sol" button.
Once the code is compiled, navigate to the "Deploy & Run Transactions" tab. Select the myToken contract from the dropdown menu, and click on the "Deploy" button.
After deployment, you can mint and burn tokens by interacting with the mint and burn functions:
To mint tokens, enter the recipient's address and the amount to mint.
To burn tokens, input the address and the amount of tokens to burn (ensuring the address has enough tokens).

## Authors
Metacrafter marcon_zumi


## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
