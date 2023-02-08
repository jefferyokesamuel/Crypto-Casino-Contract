const { ethers } = require('hardhat')


describe('Casino', async function() { 
    const[owner, otherAccount] = await ethers.getSigners()
    const Casino = await ethers.getContractFactory("Casino")
  
})