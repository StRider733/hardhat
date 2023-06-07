//hre --> hardhat runtiöe environment
const hre = require ("hardhat");

async function main(){
    const greeter = await hre.ethers.getContractFactory ("HelloSolidity");

    //deploying contract
    const deployed_greeter = await greeter.deploy ("Hello, Hardhat!");

    //waiting for the contract to be deployed
    await deployed_greeter.deployed();
    

    console.log("Hello Solidity contract address : ", deployed_greeter.address);

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.log("error ",error);
        process.exit(1);
    })

