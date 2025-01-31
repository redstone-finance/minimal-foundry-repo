# Foundry <> Redstone

Tested on:
$ node -v
v18.16.0
$ yarn -v
1.22.21

1. Clone
   `git clone --recurse-submodules -j8 https://github.com/redstone-finance/minimal-foundry-repo.git`
2. Build redstone protocol
   `pushd ./lib/redstone-oracles-monorepo/packages/protocol && yarn workspaces focus && rm -rf ../cli && yarn add --dev typescript && yarn build && popd`
3. Run tests
   `forge test --ffi -vvv`

Check file `test/Counter.t.sol` to see how to mock redstone oracles.
