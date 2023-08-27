# ERC20 degentoken

This solidity program is a program deployed in the avalanche test network that mints, transfers, redeems, checks the balance, and burns tokens.

## Description
The task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract should have the following functionality:

Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
Transferring tokens: Players should be able to transfer their tokens to others.
Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
Checking token balance: Players should be able to check their token balance at any time.
Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

## Getting Started
### Executing program

* To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.
* Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension. Copy and paste the following code into the file:
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract DegenGamingToken is ERC20, Ownable, ERC20Burnable {

    struct InGameItem {
        string name;
        uint256 value; // Token value required to redeem the item
    }

    InGameItem[] public availableItems; // List of available in-game items

    constructor() ERC20("Degen", "DGN") {
        // Initialize items
        availableItems.push(InGameItem("DGN Shirt", 100)); // 100 tokens for a shirt
        availableItems.push(InGameItem("DGN Mug", 50));    // 50 tokens for a mug
        availableItems.push(InGameItem("DGN Cap", 75));    // 75 tokens for a cap
    }

    function getAvailableItems() public view returns (InGameItem[] memory) {
        return availableItems;
    }
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function redeemItem(uint256 itemIndex) public {
        require(itemIndex < availableItems.length, "Invalid item index");
        require(balanceOf(msg.sender) >= availableItems[itemIndex].value, "Not enough tokens");

        _burn(msg.sender, availableItems[itemIndex].value);
    }


    function transferTokens(address _reciever, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enought Degen Tokens");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _reciever, _value);
    }
}
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar.

When you deploy the contract you must connect you Metamask with the remix editor and in the environment choose the injected provider. Make sure that you have AVAX test tokens in your account before deplolying the contract

If you do not have any AVAX test tokens, get here: https://core.app/tools/testnet-faucet/?subnet=c&token=c


## Authors
Bjorn


## License

This project is licensed under the MIT License.
