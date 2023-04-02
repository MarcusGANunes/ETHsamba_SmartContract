const { expect } = require("chai");


describe("NFT Test", function() {
  it("Should get user NFTs collection length", async function() {

    const accounts = await ethers.getSigners()
    const accountAddress = accounts[0].address

    const nft = await ethers.getContractFactory("nft")

    const nftDeployed = await nft.deploy()
    
    const balanceAfter = await nftDeployed.balanceOf(accountAddress)
    expect(0).to.equal(Number(balanceAfter.toString()))
  })
  it("Should mint nft", async function() {

    const accounts = await ethers.getSigners()
    const accountAddress = accounts[0].address

    const nft = await ethers.getContractFactory("nft")

    const nftDeployed = await nft.deploy()
    
    await nftDeployed.mint(accountAddress, "bafybeihagsgvw7qufxqgz2cz3ftckuzt42wax2n2dwp7p2ato2ieqc7oga/DWL8dLv27EFtiw9XnynBF.jpg")

    const balance = await nftDeployed.balanceOf(accountAddress)
    expect(1).to.equal(Number(balance.toString()))
    await nftDeployed.deleteToken(1)
    const balanceAfter = await nftDeployed.balanceOf(accountAddress)
    expect(0).to.equal(Number(balanceAfter.toString()))
  })
  it("Should delete a minted nft", async function() {

    const accounts = await ethers.getSigners()
    const accountAddress = accounts[0].address

    const nft = await ethers.getContractFactory("nft")

    const nftDeployed = await nft.deploy()
    
    await nftDeployed.mint(accountAddress)
    await nftDeployed.deleteToken(1)

    const balanceAfter = await nftDeployed.balanceOf(accountAddress)
    expect(0).to.equal(Number(balanceAfter.toString()))
  })
})