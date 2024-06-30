# Building-on-Avalanche
## Degen Token (ERC-20): Unlocking the Future of Gaming

Degen Token (symbol: DGN) is an ERC-20 token designed for the gaming ecosystem. This smart contract provides functionalities for minting, transferring, redeeming, burning tokens, and tracking token balances. It is built on the Avalanche network, ensuring high throughput and low latency for all transactions.

## Description
This repository contains the Solidity code for the Degen ERC20 token  (symbol: DGN). The contract leverages OpenZeppelin's ERC20 and Ownable contracts to ensure secure and standardized token behavior. With the help of this contact, the owner will be able to mint tokens, burn tokens, transfer tokens, redeem tokens and also check their token balance at any time. 
## Getting Started
### Installing
To use Degen Token, download or clone the solidity contact file attached to this repository.

### Executing program
You can use Remix, an online Solidity IDE to run this program. To get started, go to the Remix website at https://remix.ethereum.org/.
Further steps,
1. Compile the DegenToken contract on an Ethereum-compatible blockchain. 
2. Select the environment as injected provider Metamask and connect your wallet.
3. Deploy the DegenToken contract on  an Ethereum-compatible blockchain.
4. Now after deployment we have various functions available there like burn, transfer, mint  and redeem.
5. You can also check the  balance of the token in the balanceOf Function.
6. For burning the tokens insert the account address  and no. of the token that needs to be burnt then click on transact.
7. For minting the tokens insert the account address  and no. of the token that needs to be minted then click on transact.
8. For transferring the tokens insert the account address to which the token has to be transferred and add the no of tokens.
9. After all this copy the contract address and paste it into snowtrace testnet to verify that the contract created and all functions are performed successfully.


   These are steps by which we can mint tokens, burn tokens,redeem,transfer tokens and tracking token balance of addresses.


```
 //  function mint(address _to, uint256 _amount) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Mint(_to, _amount);
    } 

```
  //
  function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        require(from != address(0), "Cannot transfer from zero address");
        require(to != address(0), "Cannot transfer to zero address");
        return super.transferFrom(from, to, amount);
    }

```
//
    function redeem(uint256 amount) public {
        address from = _msgSender();
        require(balanceOf(from) >= amount, "Not enough balance");
        _burn(from, amount);
        emit Redeem(from, amount);
    }
```

## Authors

Harsh Gautam
@gautamharshu7767@gmail.com

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
