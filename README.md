# web3_practice_contract
東大ブロックチェーン講座練習用コントラクト

https://drive.google.com/file/d/1AegFGk6dzqmP32SOJG8soE_8Wx6fsWTb/view
https://github.com/foundry-rs/foundry

Foundryプロジェクト初期化
```
$ forge init --force --vscode
$ forge build
$ forge test
```

ローカルにプロジェクトをデプロイする
```
$ anvil
# https://github.com/blockchaininnovation/practice_contract/blob/c57f8364bde3b8def1bfaf0e94a0b6381a49c3e6/script/Deployment.s.solをコピー
$ forge script script/Deployment.s.sol --rpc-url http://127.0.0.1:8545 --broadcast
# https://github.com/blockchaininnovation/practice_contract/blob/c57f8364bde3b8def1bfaf0e94a0b6381a49c3e6/script/Counter.s.solをコピー
$ forge script script/Counter.s.sol --rpc-url http://127.0.0.1:8545 --broadcast
```

