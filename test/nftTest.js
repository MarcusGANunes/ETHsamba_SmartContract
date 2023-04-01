const { expect } = require("chai");

describe("TinyVillage Test", function() {
  it("Should mint nft", async function() {

    const accounts = await ethers.getSigners()

    const nft = await ethers.getContractFactory("nft")
    const nftDeployed = await nft.deploy();

    await nftDeployed.mint()
    const balance = await nftDeployed.balanceOf(accounts[0].address,0)
    console.log(balance)
    // expect(3s).to.equal(Number(balance.toString()))
  })
})