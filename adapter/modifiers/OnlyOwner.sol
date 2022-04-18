pragma ton-solidity >= 0.58.1;
pragma AbiHeader expire;

abstract contract OnlyOwner {
    modifier onlyOwner() {
        require(msg.pubkey() == tvm.pubkey(), 100);
        _;
    }
}