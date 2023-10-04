// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract classtest{

    uint public balance;

    constructor ( uint ATMPIN){
        if( ATMPIN == 1111){
           
            
        }
        
    }
    function addbalance ( uint amount1)public{
            balance = balance + amount1;

        }
    function withdrow (uint amount)public{
        balance = balance - amount;
    }
        
}

    


