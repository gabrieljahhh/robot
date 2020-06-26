*** Settings ***
Resource         ResourceCepSuite.robot


Test Setup       Abrir navegador
Test Teardown    Fechar navegador


*** Test Cases ***
Cenário de Teste 01: Buscar um endereço pelo site UI
    Acessar o site
    Localizar o botão com o Estado de "São Paulo"
    Localizar o botão a Cidade de "São Paulo"
    Localizar o botão com o Bairro "Jardim São Luís"
    Localizar o botão com o CEP "05844-055"
    Conferir informações



Cenário de Teste 02: Buscar outro endereço cep pelo site UI
    Acessar o site
    Localizar o botão com o Estado de "Rio de Janeiro"
    Localizar o botão a Cidade de "Rio de Janeiro"
    Localizar o botão com o Bairro "Barra da Tijuca"
    Localizar o botão com o CEP "22640-102"
    Conferir informações
