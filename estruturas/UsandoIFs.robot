*** Settings ***
Documentation    Suite para exemplificar o uso de IF nos testes
...              O IF deve ser pouco utilizado, mas tem hora que não tem jeito
...              e precisamos dele mesmo, então vamos ver como é!

Library    SeleniumLibrary

*** Variable ***
@{FRUTAS}    fruta1    fruta2    fruta3    

*** Test Case ***
Caso de teste exemplo 01
    Rodando uma keyword dada uma condição = true
    Rodando uma keyword dada uma condição = false
    Armazenando um valor em uma variável dada uma condição


*** Keywords ***
Rodando uma keyword dada uma condição = true
    Run Keyword If    '${FRUTAS[1]}' == 'fruta2'    Log    O item numero 1 é a fruta2!

Rodando uma keyword dada uma condição = false
    Run Keyword Unless    '${FRUTAS[1]}' == 'fruta1'    Log    O item numero 1 não é a fruta1!

Armazenando um valor em uma variável dada uma condição
    ${VAR}    Set Variable If                     '${FRUTAS[2]}' == 'fruta3'    fruta3
    Log       Minha variável VAR é uma ${VAR}!