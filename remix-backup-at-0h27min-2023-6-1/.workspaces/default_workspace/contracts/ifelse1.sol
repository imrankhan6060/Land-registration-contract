// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;


contract Marksheet{

    function CheckGrade(uint number)public pure returns(string memory){


        if(number >=90 && number<=100 ){
            return " you have A1 grade";

        }
        else if (number >=80 && number < 90 ){
            return " you have A grade";
    }
      else if (number >=70 && number < 80 ){
            return " you have B grade";
      }
      else if (number >=60 && number < 70 ){
            return " you have C grade";
      }
      else {
          return "you are fail";
      }

}


}