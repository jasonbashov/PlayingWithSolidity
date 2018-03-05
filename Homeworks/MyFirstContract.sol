pragma solidity ^0.4.19;

contract SimpleContract {
    string private name;
    uint private balance;
    
    function SimpleContract() public {
        name = "MyFirstContract";
    }
    
    function getBalance() private view returns (uint) {
        return balance;
    }

    function getName() private view returns (string) {
        return name;
    }
    
    function recieveMoney(uint deposit) public {
        balance += deposit;
    }
    
    function toString() public view returns (string, uint) {
        return (getName(), getBalance());
    }
}