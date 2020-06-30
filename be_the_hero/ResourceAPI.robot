*** Settings ***
Documentation    Implementação de automação em site para doações para necessidades. http://wfsweb.com/hero/
Library          SeleniumLibrary
Library          String

Library          RequestsLibrary
Library          Collections

*** Variables ***
${URL}           http://wfsweb.com/hero/
${URL_API}       http://wfsweb.com:9001
${BROWSER}       chrome
*** Keywords ***


API Connect
    Create Session                   session                ${URL_API}                       verify=True
#### ACESSAR O SISTEMA
Acessar o App Be The Hero
    Open Browser                     about:blank            ${BROWSER}
    Go To                            ${URL}
    Title Should Be                  Be The Hero
Clicar no botão Não tenho Cadastro
    Click Element                    id=register
No campo Nome da ONG: "${NOME}"
    Input Text                       id=name                ${NOME}
No campo E-mail: "${EMAIL}"
    Input Text                       id=email               ${EMAIL}
No campo WhatsApp: "${WHATSAPP}"
    Input Text                       id=whatsapp            ${WHATSAPP}
No campo Cidade: "${CIDADE}"
    Input Text                       id=cidade              ${CIDADE}
No campo UF: "${UF}"
    Input Text                       id=uf                  ${UF}
Clicar no botão Cadastrar
    Click Element                    id=new_ong
Armazenar ID que foi gerado para a ONG
    ${ID}                            Handle Alert
    ${ID}                            Get Substring	${ID}    18
    Set Global Variable              ${ID}

No campo Sua ID deve digitar o ID que foi gerado
    Input Text                       id=sua_id              ${ID}

Clicar no botão Entrar
    Click Element                    id=entrar
Clicar no botão Cadastrar Novo Caso
    Wait Until Element Is Visible    id=new_case
    Click Element                    id=new_case

No campo Titulo do Caso: "${TITULO}"
    Input Text                       id=titulo              ${TITULO}
No campo Descrição: "${DESCRICAO}"
    Input Text                       id=descricao           ${DESCRICAO}
No campo valor: "${VALOR}"
    Input Text                       id=valor               ${VALOR}
Clicar no botão Cadastrar Caso
    Click Element                    id=add_case

Clicar no Botão Logout
    Wait Until Element Is Visible    id=logout
    Click Element                    id=logout
    Close Browser


###API
Validar ONG pelo ID gerado
    ${HEADERS}                       Create Dictionary      Content-Type=application/json
    ${RES}                           Post Request           session                          /sessions
    ...                              data={"id":"${ID}"}
    ...                              headers=${HEADERS}
    Log                              ${RES.text}

Verificar os Casos Cadastrados pela ONG
    ${HEADERS}                       Create Dictionary      Authorization=${ID}
    ${RES}                           Get Request            session                          /profile
    ...                              headers=${HEADERS}
    Log                              ${RES.text}
Listar todas as ONGS cadastradas
    ${RES}                           Get Request            session                          /ongs
    Log                              ${RES.text}

Listar todos os Casos Cadastrados
    ${RES}                           Get Request            session                          /incidents
    Log                              ${RES.text}