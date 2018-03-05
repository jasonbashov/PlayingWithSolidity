pragma solidity ^0.4.20;

contract BasicContract {
    address private _owner;
    address private _service;
    uint256 private _timeOfLastPurchase;
    uint256 private _timeOfLastWithdraw;
    uint256 private _balance;
    
    function BasicContract() public {
        _owner = msg.sender;
        _timeOfLastPurchase = 0;
        _timeOfLastWithdraw = 0;
    }
    
    event ServicePurchase(address serviceBuyer, uint256 purchaseTimeStamp);
    
    modifier TimeInterval {
        if((block.timestamp - _timeOfLastPurchase) < 2 minutes){
            msg.sender.transfer(msg.value);
            return;
        }
        _;
    }
    
    function BuyService() public TimeInterval payable {
        if(msg.value > 1 ether){
            uint256 diffToReturn = msg.value - 1 ether;
            msg.sender.transfer(diffToReturn);
        } else if (msg.value < 1 ether) {
            msg.sender.transfer(msg.value);
            return;
        }
        
        _timeOfLastPurchase = block.timestamp;
        ServicePurchase(msg.sender ,_timeOfLastPurchase);
        _service = msg.sender;
        _balance += 1 ether;
    }
    
    function Withdraw(uint256 amount) public {
        require(msg.sender == _owner);
        if((block.timestamp - _timeOfLastWithdraw) < 1 hours) {
            return;
        }
        
        require(amount <= 5 ether);
        require(amount <= _balance);
        
        _timeOfLastWithdraw = block.timestamp;
        _balance -= amount;
         _owner.transfer(amount);
    }
    
    function GetContractOwner() public view returns(address) {
        return _owner;
    }
    
    function GetBalance() public view returns(uint256) {
        require(msg.sender == _owner);
        return _balance;
    }
    
    function GetServiceOwner() public view returns(address) {
        return _service;
    }
}