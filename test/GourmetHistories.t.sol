// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/GourmetHistories.sol";

contract GourmetHistoriesTest is Test {
    GourmetHistories public gourmetHistories;
    address public user1 = address(1);
    address public user2 = address(2);

    function setUp() public {
        gourmetHistories = new GourmetHistories();
    }

    // テスト用のヘルパー関数
    function createGourmetHistory(
        address user,
        string memory shop,
        string memory lat,
        string memory lng
    ) private {
        vm.prank(user);
        gourmetHistories.addGourmetHistory(shop, lat, lng);
    }

    // グルメ履歴を追加できること
    function testAddGourmetHistory() public {
        // 準備
        string memory shop = unicode"テストレストラン";
        string memory lat = "35.681236";
        string memory lng = "139.767125";

        // 実行
        createGourmetHistory(user1, shop, lat, lng);

        // 検証
        GourmetHistories.GourmetHistory[] memory histories = gourmetHistories.getGourmetHistory(user1);
        assertEq(histories.length, 1, "has one record");
        assertEq(histories[0].shop, shop, "shop name is correct");
        assertEq(histories[0].latitude, lat, "latitude is correct");
        assertEq(histories[0].longitude, lng, "longitude is correct");
    }
}
