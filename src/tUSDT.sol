// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin-contracts-5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin-contracts-5.0.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin-contracts-5.0.2/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin-contracts-5.0.2/access/Ownable.sol";
import "@openzeppelin-contracts-5.0.2/token/ERC20/extensions/ERC20Permit.sol";

contract TestUSDC is ERC20, ERC20Burnable, ERC20Pausable, Ownable, ERC20Permit {
    constructor(address initialOwner)
        ERC20("Test USDT", "tUSDT")
        Ownable(initialOwner)
        ERC20Permit("Test USDT")
    {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }
}