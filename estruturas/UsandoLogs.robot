*** Settings ***

Documentation    Suite para exemplaificar o uso de Logs nos testes


Library          SeleniumLibrary

*** Variable ***
@{FRUTAS}        fruta1                                               fruta2    fruta3

*** Test Case ***
Caso de teste exemplo 01
    Usando LOG para mensagens
    Usando LOG console
    Usando screen shots


*** Keywords ***
Usando LOG para mensagens
    Log                          Minha mensagem de LOG
    ${VAR}                       Set Variable                                                            variável qualquer
    Log                          Posso logar uma ${VAR} no meio de um log

Usando LOG console
    Log To Console               Posso logar na saída do console
    Log Many                     Posso logar minha lista completa @{FRUTAS}
    Log                          Posso logar somente itens da minha lista ${FRUTAS[0]} - ${FRUTAS[1]}

Usando screen shots
    Log                          Nos teste web, podemos logar
    Open Browser                 http://wfsweb.com/                                                      chrome
    Capture Page Screenshot      screenshot.png
    Close Browser
