// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo3 {


    // STRINGS
    // строки нельзя "склеивать"
    // к элементу строки нельзя обратиться по индексу
    string public myStr = "test";   // storage

    // memory - модификатор для переменных которые не хранятся в блокчейне а только в расках операции, чтоит всегда указывать этот модификатор
    function demo(string memory newValueStr) public {
        string memory myTempStr = "temp";
        myStr = newValueStr;
    }

		
    // ADDRESSES
    // собственно сам адрес плательщика или любоко кто обращается к смарт-контракту
    address public myAddr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;   // storage
    
    function getBalance(address targetAddr) public view returns(uint) {
        // у переменной адрес всегда есть свойство balance 
        return targetAddr.balance;
    }

    function transferTo(address targetAddr, uint amount) public {
        // создаем временную переменную с модификатором payable для того чтобы на нее можно было смовершать транзакцию
        address payable _to = payable(targetAddr);
        // transfer - метод для совершения транзакции на адрес
        _to.transfer(amount);
    }

    

		
    //MAPPINGS:
    mapping (address => uint) public payments; // storage

    function receiveFunds() public payable {
        payments[msg.sender] = msg.value;
    }


}