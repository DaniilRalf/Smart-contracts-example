// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo2 {


    // Все переменны е обьявленые в классе явалсяются платными 
    bool public myBool = true; // булевая переменная (по умолчанию false)

    function myFunc(bool _inputBool) public {
        bool localBool = false; // local
        localBool && _inputBool // AND
        localBool || _inputBool // OR
        localBool == _inputBool // EQUAL
        localBool != _inputBool // NOT EQUAL
        !localBool // NOT
		
        if(_inputBool || localBool) {
        }
    }



    // Числа без знака (положительное) UNSINGED INTEGERS
    uint public myUint = 42;  // 256 бит uint256, макс 2^256  (есть еще uint8 uint16 uint24 uint32)
    uint8 public myUint = 100; 

    // Числа со знаком (отрицательное) SIGNED INTEGERS
    int public myInt = -42;  // тоже самое что и с положительными только отрицательные, но учитываем что для хранения знака будет выбелять 1 бит
    int8 public mySmallInt = -1
    
    function math(uint _inputUint) public {
        uint localUint = 42;
        localUint + 1;
        localUint - 1;
        localUint * 2;
        localUint / 2;
        localUint ** 3;
        localUint % 3;
        -myInt; // унарный минус

        localUint == 1;
        localUint != 1;
        localUint > 1;
        localUint >= 1;
        localUint < 2;
        localUint <= 2;
    }



    // ПОлучить мкаксимальное и минимальные значения, можно использовать для проверки типов даннх
	uint public maximum;
    function getMax() public {
        maximum = type(uint8).max;
    }
    uint public minimun;
    function getMin() public {
        minimun = type(uint8).min;
    }


    // Отлавливает ошибки переполнения
    uint8 public myVal = 1;
    function dec() public {
        unchecked { // при переполнению отскочит к началу диапазона типа
            myVal--;
        }
    }

}