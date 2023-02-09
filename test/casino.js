const { ethers } = require('hardhat')

const valBwin = ethers.utils.keccak256(0x600D60A7)

describe('Casino', async function() { 
    it('Not allow you place a zero bet', async () => {
    const Casino = await ethers.getContractFactory("Casino")
    const casino = await Casino.deploy()
    try{
        tx = casio.proposeBet(hashA)
    }
});
})