pragma solidity ^0.4.19;

contract MathFunctions {
    int private _stateNumber;
    
    function MathFunctions() public {
        _stateNumber = 0;
    }
    
    function add(int inputNumber) public payable returns (int) {
        return _stateNumber += inputNumber;
    }

    function substract(int inputNumber) public payable returns (int) {
        return _stateNumber -= inputNumber;
    }
    
    function multiply(int inputNumber) public payable returns (int) {
        return _stateNumber *= inputNumber;
    }
    
    function divide(int inputNumber) public payable returns (int) {
        return _stateNumber /= inputNumber;
    }
    
    function getState() public view returns (int) {
        return _stateNumber;
    }
    
    function resetState() public {
        _stateNumber = 0;
    }
}