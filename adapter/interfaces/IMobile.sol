pragma ton-solidity >= 0.58.1;

import "ITraveler.sol";

interface IMobile {
    function mCall(ITraveler traveler) external view;
}