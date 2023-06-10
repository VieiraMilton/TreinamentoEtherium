// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract ContratoAluguel {

  string public locador;
  string public locatario;
  uint256[36] public valoresAluguel;

  constructor(string memory _locador, string memory _locatario, uint256 valorInicialAluguel) {
    locador = _locador;
    locatario = _locatario;

    for (uint i = 0; i < 36; i++) {
      valoresAluguel[i] = valorInicialAluguel;
    }
  }

// Valor do aluguel

  function valorAluguel(uint256 mes) public view returns (uint256) {
    require(mes > 0 && mes <= 36, "Mês inválido. Insira um valor entre 1 e 36.");
    return valoresAluguel[mes - 1]; 
  }

  function getNomes() public view returns (string memory, string memory) {
      return (locador, locatario);
  }

  function alterarNome(uint8 tipoPessoa, string memory novoNome) public {
    if (tipoPessoa == 1) {
      locador = novoNome;
    } else if (tipoPessoa == 2) {
      locatario = novoNome;
    } else {
      revert("Tipo de pessoa inválido.  Informe: 1 - Locador e 2 - Locatário.");
    }
  }

//Reajuste do Aluguel

  function reajusteAluguel(uint256 mes, uint256 aumento) public {
    require(mes > 0 && mes <= 36, "Mês inválido. Por favor, insira um valor entre 1 e 36.");

    for (uint i = mes; i < 36; i++) {
      valoresAluguel[i] += aumento;
    }
  }
}
// 0xc4d26824000DCa8B67602deA7930b953670B532e
