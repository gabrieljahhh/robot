*** Settings ***
Documentation    Suite para exemplificar o uso de LOOPS nos testes



*** Variables ***
@{FRUTAS}    maça    banana    uva    abacaxi


*** Test Cases ***
Caso de teste exemplo 01
    # Usando FOR com RANGE
    Usando FOR com LISTA
    # Saindo de um FOR
    # Usando a keyword REPEAT


*** Keywords ***
# Usando FOR com RANGE
    # FOR               ${COUNT}                                           IN RANGE    1                  6
    # Log               meu contato é: ${COUNT}. o range será de 1 a 5!
    # Run Keyword If    ${COUNT} == 5                                      Log         Acabou o LOOP!!
    # END

Usando FOR com LISTA
    FOR                 ${ITEM}                  IN    @{FRUTAS}
    Exit for loop if    '${ITEM}' == 'banana'
    Log                 Minha fruta ${ITEM}
    END

# Saindo de um FOR
    FOR                 ${ITEM}               IN                        @{FRUTAS}
    Exit For Loop If    '${ITEM}' == 'uva'
    END                 Log                   Minha fruta é: ${ITEM}


# Usando a keyword REPEAT
    # Repeat Keyword    4    Log    Vamos logar essa frase 4 vezes!!!