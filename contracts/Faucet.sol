// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Faucet{

    address payable owner;

    constructor(address tokenAdress){
        //token interface
        owner = payable(msg.sender);
    }

    function requestToken()public {
        //oluşturulan ERC20 tokeni isteyene atma işlemini yapan fonk.
        //msg.msg.sender

        // token transferi tamamlanacak
    }

    



}