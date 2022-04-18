pragma ton-solidity >= 0.58.1;
pragma AbiHeader expire;
pragma AbiHeader pubkey;

import "interfaces/IInternet.sol";
import "modifiers/OnlyOwner.sol";

contract Internet is IInternet, OnlyOwner {
    constructor() public onlyOwner {
        require(tvm.pubkey() != 0, 101);
        tvm.accept();
    }

    function iCall(ITraveler traveler) override external view onlyOwner {
        tvm.accept();

        traveler.setTypeOfCall("Calling by internet...");
    }
}