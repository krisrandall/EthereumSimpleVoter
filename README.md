# Simple Voter

Simple Voter is a good, simple entry point to creating an Ethereum smart contract and interacting with it via Javascript (web3js).


## Prerequisites

* Have the [Metamask Chrome plugin](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en) installed and logged on, and connect to the Ropsten network



## Interacting

You can run the following javascript code right now from the Chrome developer console, as long as you have Metamask installed and logged in.


Set the contract address to the existing Simple Voter that already exists on the ropsten network ([0x94f3baf9a2e2a7e6fa46f40cb899215de96a9523](https://ropsten.etherscan.io/address/0x94f3baf9a2e2a7e6fa46f40cb899215de96a9523#code))

```
address = "0x94f3baf9a2e2a7e6fa46f40cb899215de96a9523"
```

Set the **ABI**

```
abi = [{"constant":true,"inputs":[],"name":"nos","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_vote","type":"bool"}],"name":"castVote","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"yeses","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"}]
```

Create the contract object

```
myContract = web3.eth.contract( abi ).at( address )
```

Cast a "yes" vote

```
var yesVoteData = myContract.castVote.getData( true );

web3.eth.sendTransaction({to:contract, from:web3.eth.accounts[0], data: yesVoteData}, (err, ok) => console.log(err, ok) )
```

**OR** Cast a "no" vote

```
var noVoteData = myContract.castVote.getData( false );

web3.eth.sendTransaction({to:contract, from:web3.eth.accounts[0], data: yesVoteData}, (err, ok) => console.log(err, ok) )
```

Show me how many yes votes there have been

```
myContract.yeses( function(err,ok) { console.log(err,ok.c[0]) } )
```

Show me how many no votes there have been

```
myContract.nos( function(err,ok) { console.log(err,ok.c[0]) } )
```



## Remix

You can publish your own Simple Voter to the blockchain and allow anyone to vote in your contract.   
All of the commands above remain the same, except the first one where `address` is set must be changed to be the contract address after you publish your version of the contract.

[https://remix.ethereum.org/](https://remix.ethereum.org/)

Here is the source code for the [SimpleVoter.sol](./SimpleVoter.sol) contract.

In Remix :

Compile > Details > ABI gives access to the ABI

Run > Create will deploy your new version of the contract to the blockchain you have currently selected in Metamask


