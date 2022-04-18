pragma ton-solidity >= 0.58.1;

import "IInternet.sol";

interface ITraveler {
    function setTypeOfCall(string type_of_call) external;

    function call(IInternet internet) external pure;
}