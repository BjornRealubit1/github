# Type of functions

This Solidity program is a simple functiopn program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose create a token that only the contract owner should be able to mint tokens to a provided address and any user should be able to burn and transfer tokens.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has a three functions that mint, burn, and transfer tokens, but only the mint functions has a modifier that the owner of the contract can only access.
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar.

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CustomToken is ERC20 {
    address public owner;

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
        _mint(msg.sender, 1000000 * 10**decimals()); // Mint initial supply
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.19" (or another compatible version), and then click on the "Compile CustomToekn.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Mytoken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed you can use the functions within the contract.

## Authors

Bjorn
