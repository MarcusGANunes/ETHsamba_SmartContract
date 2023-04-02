const { expect } = require("chai");


describe("NFT Test", function() {
  it("Should mint nft", async function() {

    const accounts = await ethers.getSigners()
    const accountAddress = accounts[0].address

    const nft = await ethers.getContractFactory("nft")

    const nftDeployed = await nft.deploy()
    
    await nftDeployed.mint(accountAddress, 'location')

    const balance = await nftDeployed.balanceOf(accountAddress)
    console.log(balance)
    console.log(id)
    expect(1).to.equal(Number(balance.toString()))
  })
})