// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleShop {
    mapping(address => uint256) private balances;
    uint256 public mousePrice = 1 ether;
    uint256 public keyboardPrice = 1 ether;
    uint256 public monitorPrice = 1 ether;


    function buyItem(uint256 itemId, uint256 quantity) public payable {
        require(itemId >= 1 && itemId <= 3, "Invalid item ID");
        uint256 itemPrice;
        if (itemId == 1) {
            itemPrice = mousePrice;
        } else if (itemId == 2) {
            itemPrice = keyboardPrice;
        } else if (itemId == 3) {
            itemPrice = monitorPrice;
        }

        require(
            msg.value >= itemPrice * quantity,
            "Insufficient funds to buy the items"
        );

        balances[msg.sender] += msg.value;
    }


    function setItemPrices(uint256 _mousePrice, uint256 _keyboardPrice, uint256 _monitorPrice) public {
        mousePrice = _mousePrice;
        keyboardPrice = _keyboardPrice;
        monitorPrice = _monitorPrice;
    }
}
