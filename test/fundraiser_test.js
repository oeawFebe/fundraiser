const FundraiserContract=artifacts.require("Fundraiser");
contract("Fundraiser",accounts=>{
    let fundraiser;
    const name="Beneficiary Name";
    describe("initialization",()=>{
        beforeEach (async ()=>{
            fundraiser= await FundraiserContract.new(name);



        });
        it("gets the beneficiary name",async()=>{
            assert.equal(actual,name,"names should match");
        });
    });
});