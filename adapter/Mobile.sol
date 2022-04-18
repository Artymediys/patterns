pragma ton-solidity >= 0.58.1;
pragma AbiHeader expire;
pragma AbiHeader pubkey;

import "interfaces/IMobile.sol";
import "modifiers/OnlyOwner.sol";

contract Mobile is IMobile, OnlyOwner {
    constructor() public onlyOwner {
        require(tvm.pubkey() != 0, 101);
        tvm.accept();
    }

    function mCall(ITraveler traveler) override external view onlyOwner {
        tvm.accept();

        traveler.setTypeOfCall("Calling by mobile_net...");
    }
}