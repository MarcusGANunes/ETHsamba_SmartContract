require("@nomicfoundation/hardhat-toolbox");

const fs = require('fs')
const path = require('path')
const privateKeyFile = path.join(__dirname, './.secret')
const Account = require('./scripts/createCeloTestAccount');
const Deploy = require('./scripts/deploy');

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
};

task("celo-account", "Prints account address or create a new", async () => {
  fs.existsSync(privateKeyFile) ? console.log(`Address ${Account.getAccount().address}`) : Account.setAccount();
});

task("celo-deploy", "deploy app", async () => {
    const tx = await Deploy.nft();
    console.log(tx);
    console.log(`save the contract address ${tx.contractAddress}`)
});
