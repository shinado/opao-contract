require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config()

// Go to https://infura.io, sign up, create a new API key
// in its dashboard, and replace "KEY" with it
const INFURA_API_KEY = "KEY";

// Replace this private key with your Sepolia account private key
// To export your private key from Coinbase Wallet, go to
// Settings > Developer Settings > Show private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Beware: NEVER put real Ether into testing accounts
const WALLET_PRIVATE_KEY = process.env.WALLET_PRIVATE_KEY;

module.exports = {
  solidity: "0.8.24",
  networks: {
    optism: {
      url: `https://opt-mainnet.g.alchemy.com/v2/8LQ6F_CKZvP5LrBgdTNySjZ_YaDh162T`,
      accounts: [WALLET_PRIVATE_KEY],
    },
    sepolia: {
      url: `https://opt-sepolia.g.alchemy.com/v2/HwtsQCroXMrbyMh1aQSU9TzoKaVludrW`,
      accounts: [WALLET_PRIVATE_KEY],
    },
  },
};
