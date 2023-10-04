// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract order{

    enum status{
        none,
        pending,
        accepted,
        rejected,
        shipped
    }

    status public currentstatus;

    
    function pending()public{
    require(currentstatus ==status.none,"invalid" );
        currentstatus = status.pending;
    }
    function accepted()public{
        currentstatus = status.accepted;
    }
    function rejected()public{
        currentstatus = status.rejected;
    }
    function shipped()public{
        currentstatus = status.shipped;
    }
}