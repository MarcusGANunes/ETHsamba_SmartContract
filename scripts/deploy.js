const Web3 = require('web3')
const ContractKit = require('@celo/contractkit')

const web3 = new Web3('https://alfajores-forno.celo-testnet.org')
const kit = ContractKit.newKitFromWeb3(web3)
const data = require('../artifacts/contracts/nft.sol/nft.json')
const Account = require('./createCeloTestAccount');

async function nft() {
    const account = Account.getAccount()
    kit.connection.addAccount(account.privateKey) 
    let tx = await kit.connection.sendTransaction({
        from: account.address,
        data: data.bytecode
    })
     return tx.waitReceipt()
}
module.exports = {
    nft
}