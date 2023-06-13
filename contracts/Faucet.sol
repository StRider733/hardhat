// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IERC20{
    function transfer(address to, uint256 amount) external returns (bool);
           

}


contract Faucet{

    address payable owner;
    IERC20 public token;
    uint256 public amount = 100*(10**18); 
    uint256 public lockTime = 1 minutes;

    mapping (address => uint256) nextAccessTime;

    constructor(address tokenAddress){
        //token interface
        token = IERC20(tokenAddress);
        owner = payable(msg.sender);
    }

    function requestToken()public {
        //oluşturulan ERC20 tokeni isteyene atma işlemini yapan fonk.
        //msg.msg.sender
        require(msg.sender!= address(0),"Do not use ZERO address");
        require(block.timestamp >= nextAccessTime[msg.sender],"Please wait 1 minute.");
        nextAccessTime[msg.sender] = block.timestamp + lockTime;


        // token transferi tamamlanacak
        token.transfer(msg.sender,amount);

    }

    function setLockTime(uint256 timeInMinutes) public onlyOwner {
        lockTime = timeInMinutes * 1 minutes;
    }

    function setAmount (uint256 _amount) public onlyOwner{
        amount = _amount * (10**18);
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "only owner");
        _;
    }
        
}