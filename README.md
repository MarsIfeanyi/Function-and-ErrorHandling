# Function and ErrorHandler in Smart Contract

This is a smart contract that implements the `require()`, `assert()` and `revert()` statements to handle errors in solidity smart contract

## Table of Contents

- [Function and ErrorHandler in Smart Contract](#function-and-errorhandler-in-smart-contract)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Contract Details](#contract-details)
    - [Owner Management](#owner-management)
    - [View Owner](#view-owner)
    - [Change Owner](#change-owner)
    - [Error Handling](#error-handling)
  - [Authors](#authors)
  - [License](#license)

## Overview

The `ErrorHandler` is a simple Ethereum smart contract written in Solidity, which allows for basic ownership management and error handling. It includes functionalities for managing the contract's owner, asserting conditions, and handling errors gracefully.

## Contract Details

### Owner Management

The contract provides an `owner` variable to store the Ethereum address of the owner. The owner is initially set to the address that deploys the contract.

### View Owner

The `getOwner` function allows anyone to check and retrieve the current owner's Ethereum address. However, it enforces a requirement that the caller must be the owner to access this information. If the caller is not the owner, an error message is provided.

### Change Owner

The `setOwner` function enables the owner to transfer ownership to a new Ethereum address. This function is restricted to the current owner; if the caller is not the owner, an error is raised.

### Error Handling

The testAssert function demonstrates the use of the assert statement in Solidity. It asserts that the variable number is equal to 0. If this condition is not met, it will result in an unrecoverable error, effectively terminating the execution of the contract. This function is for illustrative purposes and does not have a direct practical application.

## Authors

Marcellus Ifeanyi
[@metacraftersio](https://twitter.com/Mars_Energy)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
