//hre --> hardhat runtime environment


const hre = require ("hardhat");

async function main(){
    const mytoken = await hre.ethers.getContractFactory ("MyToken");

    //deploying contract
    const deployed_mytoken = await mytoken.deploy ();

    //waiting for the contract to be deployed
    await deployed_mytoken.deployed();
    

    console.log("MyToken contract address : ", deployed_mytoken.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.log("error ",error);
        process.exit(1);
    })


    