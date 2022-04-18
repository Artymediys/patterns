pragma ton-solidity >= 0.58.1;
pragma AbiHeader expire;
pragma AbiHeader pubkey;

import "interfaces/IInternet.sol";
import "interfaces/IMobile.sol";
import "modifiers/OnlyOwner.sol";

contract MobileToInternetAdapter is IInternet, OnlyOwner {
    IMobile private mobileNet;

    constructor(IMobile mobile) public onlyOwner {
        require(tvm.pubkey() != 0, 101);
        tvm.accept();

        mobileNet = mobile;
    }

    function iCall(ITraveler traveler) override external onlyOwner view {
        tvm.accept();

        mobileNet.mCall(traveler);
    }
}