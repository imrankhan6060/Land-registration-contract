// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract ErrorHanding{


    uint public number;

    error InvalidNumber();

    function errorhanding(uint num)public  {

        require(num >10, "invalid");
        number = num;
        
    }

    function RevertEroor( uint num)public {
        if(num < 10){
            revert InvalidNumber();
        }
        number = num;

    }
}
