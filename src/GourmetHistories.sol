// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GourmetHistories {
    // お店や緯度経度を保存する構造体
    struct GourmetHistory {
        string shop;
        string latitude;
        string longitude;
    }

    // ユーザーのアドレスをキーにして、ユーザー情報を保存するマッピング
    mapping(address => GourmetHistory[]) private gourmetMap;

    // グルメ履歴を登録する関数
    function addGourmetHistory(string memory _shop, string memory _lat, string memory _lng) public {
        // msg.senderは関数を呼び出したアドレス
        gourmetMap[msg.sender].push(GourmetHistory({shop: _shop, latitude: _lat, longitude: _lng}));
    }

    // ユーザーが保持するグルメ履歴を取得する関数
    function getGourmetHistory(
        address _userAddress
    ) public view returns (GourmetHistory[] memory) {
        return gourmetMap[_userAddress];
    }
}