// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {


    event Redeem(address indexed from, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    constructor() ERC20("Degen", "DGN") {
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Unable to mint to a zero address");
        _mint(to, amount);
    }

    function redeem(uint256 amount) public {
        address from = _msgSender();
        require(balanceOf(from) >= amount, "Not enough balance");
        _burn(from, amount);
        emit Redeem(from, amount);
    }

    function burn(uint256 amount) public {
        address from = _msgSender();
        require(balanceOf(from) >= amount, "Not enough balance");
        _burn(from, amount);
        emit Burn(from, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(to != address(0), "Cannot transfer to zero address");
        return super.transfer(to, amount);
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        require(from != address(0), "Cannot transfer from zero address");
        require(to != address(0), "Cannot transfer to zero address");
        return super.transferFrom(from, to, amount);
    }

    function balanceOf(address account) public view override returns (uint256) {
        return super.balanceOf(account);
    }
}

