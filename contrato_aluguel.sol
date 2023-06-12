// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract AluguelContract {
    string nomeLocador;
    string nomeLocatario;
    uint256[] valoresAluguel;
    uint256 posicaoAluguel = 1;

    struct Aluguel {
        string nomeLocador;
        string nomeLocatario;
        uint256[] valoresAluguel;
    }

    mapping(uint256 => Aluguel) public alugueis;

    constructor(
        string memory _nomeLocador,
        string memory _nomeLocatorio,
        uint256 valorInicialAluguel
    ) {
        for (uint256 i = 0; i < 36; i++) {
            valoresAluguel.push(valorInicialAluguel);
        }
        Aluguel memory aluguel = Aluguel(
            _nomeLocador,
            _nomeLocatorio,
            valoresAluguel
        );
        alugueis[posicaoAluguel] = aluguel;
    }

    modifier validaMesAluguel(uint256 numeroMes) {
        require(numeroMes > 0, "mes nao existe!");
        _;
    }

    function retornarValorAluguelPorMes(uint256 numeroMes)
        external
        view
        validaMesAluguel(numeroMes)
        returns (uint256)
    {
        return alugueis[posicaoAluguel].valoresAluguel[numeroMes - 1];
    }

    function retornarNomesParticipantes()
        public
        view
        returns (string memory, string memory)
    {
        return (
            alugueis[posicaoAluguel].nomeLocador,
            alugueis[posicaoAluguel].nomeLocatario
        );
    }

    function retornarNomeLocatorio() public view returns (string memory) {
        return alugueis[posicaoAluguel].nomeLocador;
    }

    function alterarNome(uint256 tipoPessoa, string memory novoNome) public {
        require(bytes(novoNome).length != 0, "nome nao pode estar vazio");

        if (tipoPessoa == 1) {
            alugueis[posicaoAluguel].nomeLocatario = novoNome;
        } else if (tipoPessoa == 2) {
            alugueis[posicaoAluguel].nomeLocador = novoNome;
        }else{
             revert("Digite um tipo de pessoa valido");
        }
    }

    function reajustarAluguel(uint256 mesInicial, uint256 valorReajuste)
        external
        validaMesAluguel(mesInicial)
    {
        if (valorReajuste <= 0) {
            revert("Valor do reajuste invalido");
        }
        uint256 indice = mesInicial - 1;
        for (uint256 i = indice; i < 36; i++) {
            alugueis[posicaoAluguel].valoresAluguel[i] += valorReajuste;
        }
    }
}
// 0xEFe6576e30a69a920879051D7AE214F0EcD5081c
