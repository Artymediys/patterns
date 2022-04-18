pragma ton-solidity >= 0.58.1;
pragma AbiHeader expire;
pragma AbiHeader pubkey;

import "interfaces/ITraveler.sol";
import "modifiers/OnlyOwner.sol";

import "Traveler.sol";
import "Mobile.sol";
import "Internet.sol";
import "MobileToInternetAdapter.sol";

contract Main is OnlyOwner {
    ITraveler traveler;
    mapping(string => address) contractAddresses;

    constructor(
        TvmCell code_traveler,
        TvmCell code_mobile,
        TvmCell code_internet,
        TvmCell code_adapter
        ) public onlyOwner {
        require(tvm.pubkey() != 0, 101);
        tvm.accept();

        _deployAllContracts(code_traveler, code_mobile, code_internet, code_adapter);

        // Example
        ITraveler(contractAddresses["traveler"]).call(IInternet(contractAddresses["internet"]));
        ITraveler(contractAddresses["traveler"]).call(IInternet(contractAddresses["adapter"]));
    }

    function _deployAllContracts(
        TvmCell code_t,
        TvmCell code_m,
        TvmCell code_i,
        TvmCell code_a
        ) internal onlyOwner {
        tvm.accept();

        TvmCell initData;

        // Deploy Traveler
        initData = tvm.buildStateInit({
            contr: Traveler,
            varInit: {},
            pubkey: msg.pubkey(),
            code: code_t
        });

        contractAddresses["traveler"] = new Traveler {
            stateInit: initData,
            value: 1 ton,
            flag: 1,
            code: code_t
        }();


        // Deploy Mobile
        initData = tvm.buildStateInit({
            contr: Mobile,
            varInit: {},
            pubkey: msg.pubkey(),
            code: code_m
        });

        contractAddresses["mobile"] = new Mobile {
            stateInit: initData,
            value: 1 ton,
            flag: 1,
            code: code_m
        }();


        // Deploy Internet
        initData = tvm.buildStateInit({
            contr: Internet,
            varInit: {},
            pubkey: msg.pubkey(),
            code: code_i
        });

        contractAddresses["internet"] = new Internet {
            stateInit: initData,
            value: 1 ton,
            flag: 1,
            code: code_i
        }();


        //Deploy Adapter
        initData = tvm.buildStateInit({
            contr: MobileToInternetAdapter,
            varInit: {},
            pubkey: msg.pubkey(),
            code: code_a
        });

        contractAddresses["adapter"] = new MobileToInternetAdapter {
            stateInit: initData,
            value: 1 ton,
            flag: 1,
            code: code_a
        }(IMobile(contractAddresses["mobile"]));
    }
}