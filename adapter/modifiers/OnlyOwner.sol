pragma ton-solidity >= 0.58.1;

abstract contract OnlyOwner {
    modifier onlyOwner() {
        require(msg.pubkey() == tvm.pubkey(), 100);
        _;
    }
}