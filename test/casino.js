const { ethers } = require('hardhat')

const valA = ethers.utils.keccak256(0xBAD060A7)
const hashA = ethers.utils.keccak256(valA)
const valBwin = ethers.utils.keccak256(0x600D60A7)

const valBlose = ethers.utils.keccak256(0xBAD060A7)

describe('Casino', async function() { 
    it('Not allow you place a zero bet', async () => {
    const Casino = await ethers.getContractFactory("Casino")
    const casino = await Casino.deploy()
    try{
        tx = await casino.proposeBet(hashA)
        rcpt = await tx.wait()
    }
});
})