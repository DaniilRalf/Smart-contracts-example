// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo4 {


    // Enum
    enum Status { Paid, Delivered, Received }
    Status public currentStatus;

    function paid() public {
        currentStatus = Status.Paid; //0
    }

    function delivered() public {
        currentStatus = Status.Delivered; //1
    }



    // Array
    // Fixed size:
    // комбиноровать типы данных в массивах нельзя
    uint[10] public test; // массив длиной в 10 состоящий из itn значений
    uint[3][2] public items;
    function fixedSize() public {
        test[2] = 24; // заполнение конкретного индекса массива 
        items = [
            [3,4,5],
            [6,7,8]
        ];
    }

    // Dynamic size
    uint[] public items2;
    uint public len;
    function dynArr() public {
        // при добавлении элементов длина изменяется динамически 
        items2.push(4);
        items2.push(5);
        len = items.length;
    }

    function sampleMemory() public view returns(uint[] memory) {
        // пример создания массива с фиксированной длиной(10) не в глобальной области блокчейна а в динамической
        uint[] memory tempArray = new uint[](10);
        tempArray[0] = 1;
        return tempArray;
    }




    // Byte
    bytes32 public myVar = "test here"; // fixed
    bytes public myDynVar = "test here"; // dynamic
    // 1 --> 32
    // 32 * 8 = 256
    // uint256

    function firstByte() public view returns(bytes1) {
        return myDynVar[0];
    }




    // Struct
    // что-то вроде обьектов в функциональных ЯП
    struct Payment {
        uint amount;
        uint timestamp;
        address from;
        string message;
    }

    struct Balance {
        uint totalPayments;
        mapping(uint => Payment) payments;
    }

    mapping(address => Balance) public balances;

    function pay(string memory message) public payable {
        balances[msg.sender].totalPayments++;

        uint paymentNum = balances[msg.sender].totalPayments;
        
        Payment memory newPayment = Payment(
            msg.value,
            block.timestamp,
            msg.sender,
            message
        );

        balances[msg.sender].payments[paymentNum] = newPayment;
    }

    function getPayment(address _addr, uint _index) public view returns(Payment memory) {
        return balances[_addr].payments[_index];
    }

}