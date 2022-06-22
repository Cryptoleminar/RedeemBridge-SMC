require("@nomiclabs/hardhat-waffle");

// Go to https://www.alchemyapi.io, sign up, create
// a new App in its dashboard, and replace "<your key>" with its key
const ALCHEMY_API_KEY = "<your key>";

// Replace this private key with your Rinkeby account private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Be aware of NEVER putting real Ether into testing accounts
const RINKEBY_PRIVATE_KEY = "<your private key>";


module.exports = {
  solidity: "0.8.7",
  networks: {
    hardhat: {
      chainId: 1337
    }
  }
  // connect rinkeby testnet
  // networks: {
  //   rinkeby: {
  //     url: `https://eth-rinkeby.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
  //     accounts: [`${RINKEBY_PRIVATE_KEY}`]
  //   }
  // }
};
