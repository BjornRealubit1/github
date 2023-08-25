# FrontEnd Functions

This Solidity program is a simple functiopn program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose is to display the values of the functions in a frontend webpage using html.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has three functions: deposit, withdraw, and get balance.
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar.

```// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleBank {
    mapping(address => uint256) private balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.19" (or another compatible version), and then click on the "Compile SimpleBank.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "SimpleBank" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed get the ABI and Address in the left-hand sidebar and paste it in the html file.

## Authors

Bjorn
