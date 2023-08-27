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