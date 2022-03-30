const { expect } = require("chai");

describe("Initial Test", function () {
    it("Initial test", async function () {
      const [owner] = await ethers.getSigners();
      
      const MyContract = await ethers.getContractFactory("MyContract")
      const myContract = await MyContract.deploy()

      await myContract.setMyUint(5);
      expect (await myContract.getMyUint()).to.equal(5);
      // const ownerBalance = await hardhatToken.balanceOf(owner.address);
      // expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
    });
  });