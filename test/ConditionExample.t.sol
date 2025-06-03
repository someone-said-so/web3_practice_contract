// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ConditionExample} from "../src/ConditionExample.sol";

contract ConditionExampleTest is Test {
    ConditionExample public conditionExample;

    function setUp() public {
        conditionExample = new ConditionExample();
        conditionExample.setValue(0);
    }

    function test_9() public {
        conditionExample.setValue(9);
        assertEq(conditionExample.checkValue(), "Value is less than 10");
    }

    function test_10() public {
        conditionExample.setValue(10);
        assertEq(conditionExample.checkValue(), "Value is exactly 10");
    }

    function test_11() public {
        conditionExample.setValue(11);
        assertEq(conditionExample.checkValue(), "Value is greater than 10");
    }
}
