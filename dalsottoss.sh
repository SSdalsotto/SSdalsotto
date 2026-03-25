#!/bin/bash

# Painel Scanner Android
# Autor: SSdalsotto

clear
echo "====================="
echo "  Scanner Android"
echo "  Autor: SSdalsotto"
echo "====================="
echo "Escolha uma opção:"
echo "1) Free Fire"
echo "2) Free Fire Max"
echo "0) Sair"
echo "====================="

# Função para escolher a opção
read -p "Digite o número da opção: " option

case $option in
    1)
        echo "Iniciando o scanner do Free Fire..."
        # Coloque o comando para iniciar o scanner do Free Fire aqui
        # Exemplo:
        # ./scanner_freefire.sh
        ;;
    2)
        echo "Iniciando o scanner do Free Fire Max..."
        # Coloque o comando para iniciar o scanner do Free Fire Max aqui
        # Exemplo:
        # ./scanner_freefire_max.sh
        ;;
    0)
        echo "Saindo..."
        exit 0
        ;;
    *)
        echo "Opção inválida, tente novamente."
        ;;
esac
