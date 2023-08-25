# Type of functions

This Solidity program is a simple functiopn program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose create a token that only the contract owner should be able to mint tokens to a provided address and any user should be able to burn and transfer tokens.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has a three functions that mint, burn, and transfer tokens, but only the mint functions has a modifier that the owner of the contract can only access.
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar.

```// SPDX-License-Identifier: MIT
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
    function burn (address _address, uint _value) public{
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
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.19" (or another compatible version), and then click on the "Compile MyToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Mytoken" contract from the dropdown menu, and then click on the "Deploy" button.

## Authors

Bjorn
