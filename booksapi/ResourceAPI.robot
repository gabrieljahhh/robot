*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Library          RequestsLibrary
Library          Collections

# Suite Setup    API Connect
*** Variables ***
${URL_API}       https://fakerestapi.azurewebsites.net/api/
&{BOOK_15}       ID=15
...              Title=Book 15
...              PageCount=1500

${NEWBOOK}       {"ID": 0,"Title": "Livro de Teste","Description": "Teste","PageCount": 124,"Excerpt": "string","PublishDate": "2020-06-24T15:39:15.994Z"}

*** Keywords ***
#### SETUP E TEARDOWNS
API Connect
    Create Session                    fakeAPI                                                               ${URL_API}

####             Ações
Requisitar todos os livros
    ${RESP}                           Get Request                                                           fakeAPI                          Books
    Log                               ${RESP.text}
    Set Test Variable                 ${RESP}


Requisitar o livro "${ID}"
    ${RESP}                           Get Request                                                           fakeAPI                          Books/${ID}
    Log                               ${RESP.text}
    Set Test Variable                 ${RESP}


Cadastrar um novo livro
    ${HEADERS}                        Create Dictionary                                                     content-type=application/json
    ${RESP}                           Post Request                                                          fakeAPI                          Books
    ...                               data=${NEWBOOK}
    ...                               headers=${HEADERS}
    Log                               ${RESP.text}
    Set Test Variable                 ${RESP}


Alterar um livro cadastrado com ID "${ID}"
    ${HEADERS}                        Create Dictionary                                                     content-type=application/json
    ${RESP}                           Put Request                                                           fakeAPI                          Books/${ID}
    ...                               data={"Title": "Titulo Alterado","Description": "Nova Descrição!"}
    ...                               headers=${HEADERS}
    Log                               ${RESP.text}
    Set Test Variable                 ${RESP}

Deletar um livro cadastrado com ID "${ID}"
    ${RESP}                           Put Request                                                           fakeAPI                          Books/${ID}
    Log                               ${RESP.text}
    Set Test Variable                 ${RESP}

####             Conferencias
Conferir o status code
    [Arguments]                       ${STATUSCODE}
    Should Be Equal As Strings        ${RESP.status_code}                                                   ${STATUSCODE}


Conferir o reason
    [Arguments]                       ${REASON}
    Should Be Equal As Strings        ${RESP.reason}                                                        ${REASON}


Conferir se retorna uma lista com "${QTDE}" livros
    Length Should Be                  ${RESP.json()}                                                        ${QTDE}

Conferir se retorna todos os dados corretos do livro
    Dictionary Should Contain Item    ${RESP.json()}                                                        ID                               ${BOOK_15.ID}
    Dictionary Should Contain Item    ${RESP.json()}                                                        Title                            ${BOOK_15.Title}
    Dictionary Should Contain Item    ${RESP.json()}                                                        PageCount                        ${BOOK_15.PageCount}
    Should Not Be Empty               ${RESP.json()["Description"]}
    Should Not Be Empty               ${RESP.json()["Excerpt"]}
    Should Not Be Empty               ${RESP.json()["PublishDate"]}
