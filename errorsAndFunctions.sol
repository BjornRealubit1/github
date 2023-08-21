// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract ErrorHandling{
    uint256 public value;

    // Function using require
    function valueRequried(uint256 _newValue) public {
        require(_newValue > value, "Value is greater than new Value: Input another value");
        value = _newValue;
    }


    // Function using revert
    function decrementValue(uint256 _decrementAmount) public {
        if (_decrementAmount > value) {
            revert("Cannot decrement more than the current value");
        }
        value -= _decrementAmount;
    }

    
    // Function using assert 
     function valueAssert(uint256 _newValue) public {
        uint256 oldValue = value;
        value = _newValue;
        assert(value > oldValue);
    }
}
