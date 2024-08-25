// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenGamingToken is ERC20 {

    address public owner;
    string[] public redeemableItems;
    mapping(uint256 => uint256) public itemCosts;
    mapping(address => mapping(uint256 => bool)) public itemRedeemed;

    event ItemRedeemed(address indexed user, uint256 indexed itemId, uint256 cost);

    constructor() ERC20("DegenToken", "DGN") { 
        owner = msg.sender;

        redeemableItems.push("Item 1");
        redeemableItems.push("Item 2");
        redeemableItems.push("Item 3");
        redeemableItems.push("Item 4");

        itemCosts[0] = 5;  // Example cost for Item 1
        itemCosts[1] = 10; // Example cost for Item 2
        itemCosts[2] = 15; // Example cost for Item 3 
        itemCosts[3] = 50; // Example cost for Item 4
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner allowed to execute this function");
        _;
    }

    function mintTokens(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Unable to mint to a zero address");
        _mint(to, amount);
    }

    function transferTokens(address to, uint256 amount) public returns (bool) {
        require(to != address(0), "Cannot transfer to zero address");
        return super.transfer(to, amount);
    }

    function claimReward(uint256 itemId) public {
        require(itemId < redeemableItems.length, "Item does not exist");
        uint256 cost = itemCosts[itemId];
        require(getBalance(msg.sender) >= cost, "Insufficient balance");
        require(!itemRedeemed[msg.sender][itemId], "Item already redeemed");

        _burn(msg.sender, cost);
        itemRedeemed[msg.sender][itemId] = true;
        emit ItemRedeemed(msg.sender, itemId, cost);
    }

    function checkClaims(address user) public view returns (bool[] memory) {
        bool[] memory redeemed = new bool[](redeemableItems.length); 
        for (uint256 i = 0; i < redeemableItems.length; i++) {
            redeemed[i] = itemRedeemed[user][i];
        }
        return redeemed;
    }

    function getBalance(address account) public view returns (uint256) {
        return super.balanceOf(account);
    }

    // Renamed functions to be less intuitive
    function getSign() public view returns (string memory) {
        return symbol();
    }

    function getLabel() public view returns (string memory) {
        return name();
    }

    function listRewards() public view returns (string[] memory) {
        return redeemableItems;
    }

    function getRewardCost(uint256 itemId) public view returns (uint256) {
        require(itemId < redeemableItems.length, "Item does not exist");
        return itemCosts[itemId];
    }
}
