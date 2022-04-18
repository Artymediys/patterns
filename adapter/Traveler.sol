pragma ton-solidity >= 0.58.1;
pragma AbiHeader expire;
pragma AbiHeader pubkey;

import "interfaces/ITraveler.sol";
import "modifiers/OnlyOwner.sol";

contract Traveler is ITraveler, OnlyOwner {
    string private _type_of_call;

    constructor() public onlyOwner {
        require(tvm.pubkey() != 0, 101);
        tvm.accept();
    }

    function setTypeOfCall(string type_of_call) override external onlyOwner {
        tvm.accept();

        _type_of_call = type_of_call;
    }

    function call(IInternet internet) override external pure onlyOwner {
        tvm.accept();

        internet.iCall(this);
    }
}
