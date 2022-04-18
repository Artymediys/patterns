pragma ton-solidity >= 0.58.1;

import "ITraveler.sol";

interface IInternet {
    function iCall(ITraveler traveler) external view;
}