// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserStorage {
    // ユーザー情報を表す構造体
    struct User {
        string name;
        address userAddress;
    }

    // ユーザーのアドレスをキーにして、ユーザー情報を保存するマッピング
    // このように記述することで key: address, value: Userとなるハッシュマップができる
    mapping(address => User) private users;

    // ユーザー情報を登録する関数
    function addUser(string memory _name) public {
        // msg.senderは関数を呼び出したアドレス
        users[msg.sender] = User({name: _name, userAddress: msg.sender});
    }

    // ユーザー情報を取得する関数
    // view returnsで
    // - この関数が「状態を変更しない読み取り専用のpureであること」
    // - その戻り値の型を示す、なおsolidityでは
    //   - tupleを返すことができる
    function getUser(
        address _userAddress
    ) public view returns (string memory name, address userAddress) {
        User memory user = users[_userAddress];
        return (user.name, user.userAddress);
    }

    // ユーザー情報が登録されているか確認する関数
    function userExists(address _userAddress) public view returns (bool) {
        return bytes(users[_userAddress].name).length > 0;
    }
}