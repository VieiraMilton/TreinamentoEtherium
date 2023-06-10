// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract RetornaBonus {

    string public nomeVendedor;
    uint256 public fatorBonus;

    constructor(string memory vendedor, uint256 fator)  {
        nomeVendedor = vendedor;
        fatorBonus = fator;
    }

	function calculaBonus( uint256 valorVenda) 
    public
    view
    returns(uint256 Bonus) {
        Bonus = fatorBonus*valorVenda;
        return Bonus;
    }

}
