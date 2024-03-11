// contracts/FunToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Opao is ERC20, Ownable {
    
    uint256 constant maxSupply = 1_000_000_000_000 * (10 ** 18);
    uint256 constant mintAmount = 1_000_000 * (10 ** 18);
    uint256 constant opaoPerWei = 25000000000; 

    constructor() ERC20("OPAO", "opao.club") Ownable(msg.sender) {}

    function batchMint() public payable {
        uint256 amountToMint = msg.value * opaoPerWei;
        require(
            totalSupply() + amountToMint*2 <= maxSupply,
            "Mint exceeds max supply."
        );

        _mint(msg.sender, amountToMint);
        _mint(address(this), amountToMint);
    }

    function freeMint() public {
        require(totalSupply() + mintAmount <= maxSupply, "Mint finished. ");
        _mint(msg.sender, mintAmount);
    }

    function getMaxSupply() public pure returns (uint256) {
        return maxSupply;
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No ether left to withdraw");

        (bool success, ) = payable(owner()).call{value: balance}("");
        require(success, "Transfer failed.");

        uint256 balanceOfOpao = balanceOf(address(this));
        _transfer(address(this), owner(), balanceOfOpao);
    }
}
