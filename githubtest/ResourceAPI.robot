*** Settings ***
Documentation    Realizar verificação de usuário cadastrado no Github
Library          RequestsLibrary
Library          Collections

*** Variable ***
${URL}           https://api.github.com/users


*** Keywords ***
API Connect
    Create Session        session                               ${URL}            verify=True


Buscar pelo usuário cadastro como: '${user}' no github
    ${resp}               Get Request                           session           /${user}
    Set Test Variable     ${resp}

Verificar o status code '${code}'
    ${name}               Get From Dictionary                   ${resp.json()}    name
    Run Keyword If        '${resp.status_code}' == '${code}'    Log               Sucesso! Usuário encontado! ${name}
    Run Keyword Unless    '${resp.status_code}' == '${code}'    Log               Falhou! Usuário não encontado!
