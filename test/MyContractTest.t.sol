//SPDX License-Identifier: MIT

pragma solidity ^0.8.19;

import {MyContract} from "../src/MyContract.sol";
import {Test} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";

contract MyContractTest is StdInvariant,Test{
    MyContract exampleContract;

    function setUp() public{
        exampleContract=new MyContract();
        targetContract(address(exampleContract));
    }

    //unit test
    function testIsAlwaysZeroUnit() public{
        uint256 data=0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero()==0);
    }

    //Fuzz test
    function testisAlwaysZeroFuzz(uint256 data) public{
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero()==0);
    }

    //stateful fuzzing
    function invariant_testAlwaysReturnsZero() view public{
        assert(exampleContract.shouldAlwaysBeZero()==0);

    }

}