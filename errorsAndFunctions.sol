// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyToken {

    constructor(){
        owner = msg.sender;
    }

    // public variables here
    string public tokenName = "COIN";
    string public tokenAbbrv = "CN";
    uint public totalSupply = 0; 
    address public owner;

    // mapping variable here
    mapping(address => uint) public balances;

    modifier Owner{
        assert(msg.sender == owner);
        _;
    }

    // mint function
    function mint (address _address, uint _value) public Owner{
        totalSupply += _value; 
        balances [_address] += _value;
        assert(totalSupply >= _value);
    }
    
    // burn function
    function burn (address _address, uint _value) public Owner{
        if (balances[_address] < _value) {
            revert("Insufficient balance");
        }
        totalSupply -= _value; 
        balances [_address] -= _value;
        assert(totalSupply <= type(uint).max - _value);
    }

    function transfer (address _reciever, uint _value) public{
        require(balances[msg.sender] >= _value, "Amount balance insufficient for transfer value!");
        balances[msg.sender] -= _value;
        balances[_reciever] += _value;
    }
}
