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
