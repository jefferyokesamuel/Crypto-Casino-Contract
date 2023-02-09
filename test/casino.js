const { ethers } = require('hardhat')


describe('Casino', async function() { 
    it('Not allow you place a zero bet', async () => {
    const[owner, otherAccount] = await ethers.getSigners()
    const Casino = await ethers.getContractFactory("Casino")
    const casino = await Casino.deploy()
});
})