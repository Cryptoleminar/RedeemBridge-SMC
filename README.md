# Redeem Bridge Smart Contract

This repo is for developing Redeem Bridge smart contract. The environment is based on [Hardhat Hackathon Boilerplate](https://github.com/NomicFoundation/hardhat-boilerplate) and removing the default frontend.

## Quick start

First things first, make sure you have a working Node.js >=12.0 installation. Next, install the dependencies by:

```sh
npm install
```

Once installed, let's run Hardhat's testing network that you can connect to using MetaMask:

```sh
npx hardhat node
```

Then, on a new terminal, go to the repository's root folder and run this to
deploy your contract:

```sh
npx hardhat run scripts/deploy.js --network localhost
``` 
This will deploy the contract to Hardhat Network

You will need to have [Metamask](https://metamask.io) installed and listening to `localhost 8545`.

## User Guide

You can find detailed instructions on using this repository and many tips in [its documentation](https://hardhat.org/tutorial).

To compile contract, run:

```sh
npx hardhat compile
``` 

To test contract, run:

```sh
npx hardhat test
``` 

This will run tests on built-in Hardhat Network, a local Ethereum network designed for development.
