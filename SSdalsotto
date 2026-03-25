#!/bin/bash

# Função para exibir o cabeçalho do painel
display_header() {
    clear
    echo "===================================="
    echo "        Scanner Android Panel"
    echo "          Autor: SSdalsotto"
    echo "===================================="
}

# Função para instalar pacotes necessários
install_dependencies() {
    echo "Instalando dependências..."
    pkg install git php android-tools -y
    echo "Dependências instaladas com sucesso!"
}

# Função para clonar o repositório e rodar o script
clone_and_run() {
    echo "Removendo repositório antigo (se houver)..."
    rm -rf SSdalsotto

    echo "Clonando o repositório SSdalsotto..."
    git clone https://github.com/SSdalsotto/SSdalsotto.git

    cd SSdalsotto

    echo "Executando o script PHP..."
    php dalsottoss.php
}

# Exibindo o menu
menu() {
    display_header
    echo "Escolha uma opção:"
    echo "1) Instalar dependências e rodar o script"
    echo "2) Sair"
    echo "===================================="
    read -p "Digite o número da opção: " option

    case $option in
        1)
            install_dependencies
            clone_and_run
            ;;
        2)
            echo "Saindo do painel. Até logo!"
            exit 0
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            menu
            ;;
    esac
}

# Chama o menu para exibir ao usuário
menu
