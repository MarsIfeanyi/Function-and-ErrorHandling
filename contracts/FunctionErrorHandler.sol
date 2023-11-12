// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Function and Error Handlers in Solidity Smart Contract
 * @author Marcellus Ifeanyi
 * @notice This demostrates understanding and the use of `require()`, `assert()` and `revert()` to handle errors in solidity smart contract
 * @dev This is a smart contract that implements the require(), assert() and revert() statements for error handling
 */
contract FunctionErrorHandler {
    address public owner;
    uint256 number;

    error NotOwner();

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner can call this function");
        _;
    }

    constructor() {
        // Initialize owner
        owner = msg.sender;
    }

    function setOwner(address _newOwner) public onlyOwner {
        if (msg.sender != owner) {
            revert("Not Owner");
        }
        owner = _newOwner;
    }

    function setOwner2(address _newOwner) public onlyOwner {
        // reverts with custom error
        if (msg.sender != owner) {
            revert NotOwner();
        }
        owner = _newOwner;
    }

    function getOwner() public view returns (address) {
        require(msg.sender == owner, "Not the owner");
        return owner;
    }

    function testAssert() public view {
        assert(number == 0);
    }
}
