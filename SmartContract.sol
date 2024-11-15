// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract ErrorHandlerContract {
    uint public value;

    /**
     * @dev Sets a new value. Requires that the value is greater than zero and is different from the current value.
     * @param _value The new value to be set.
     */
    function setValue(uint _value) public {
        require(_value > 0, "Value must be greater than 0.");
        require(_value != value, "New value must be different from the current value.");
        value = _value;
    }

    /**
     * @dev Performs division, requiring that the denominator is non-zero and the numerator is divisible by the denominator.
     * @param _numerator The numerator of the division.
     * @param _denominator The denominator of the division.
     * @return The result of the division.
     */
    function performDivision(uint _numerator, uint _denominator) public pure returns (uint) {
        require(_denominator != 0, "Cannot divide by zero.");
        
        if (_numerator % _denominator != 0) {
            revert("Numerator must be divisible by denominator.");
        }
        
        return _numerator / _denominator;
    }
}
