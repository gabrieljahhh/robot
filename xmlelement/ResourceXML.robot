*** Settings ***
Documentation     Realizando testes de manuliação de arquivo XML!

Library           XML
Library           String
Library           OperatingSystem


*** Variable ***
${XML_CONTENT}    ./documents/example/element.xml
${OUTPUT}	./documents/output
&{PESSOA}         nome=William                                       email=will@q4sure.com    telefone=11 98765-4321    tipo=celular    status=true    fixo=false


*** Keywords ***
Manipulando o arquivo XML
    ${GET_ID}                      Count Files In Directory    ${OUTPUT}
    ${ID}                          Convert To String           ${GET_ID}

    ${XML_CONTENT}                 Set Element Text            ${XML_CONTENT}         ${ID}                                    xpath=.//id
    ${XML_CONTENT}                 Set Element Text            ${XML_CONTENT}         ${PESSOA.nome}                           xpath=.//nome
    ${XML_CONTENT}                 Set Element Text            ${XML_CONTENT}         ${PESSOA.email}                          xpath=.//email
    ${XML_CONTENT}                 Set Element Attribute       ${XML_CONTENT}         status                                   ${PESSOA.fixo}                     xpath=.//contato[1]
    ${XML_CONTENT}                 Set Element Text            ${XML_CONTENT}         \t                                       xpath=.//contato[1]
    ${XML_CONTENT}                 Add Element                 ${XML_CONTENT}         <contato>${PESSOA.telefone}</contato>    xpath=.//dadosDoCliente	index=4
    ${XML_CONTENT}                 Set Element Attribute       ${XML_CONTENT}         status                                   true                               xpath=.//contato[2]
    ${XML_CONTENT}                 Set Element Attribute       ${XML_CONTENT}         tipo                                     ${PESSOA.tipo}                     xpath=.//contato[2]
    ${XML_CONTENT}                 Set Element Attribute       ${XML_CONTENT}         ativo                                    ${PESSOA.status}                   xpath=.//status

    Set Test Variable              ${ID}
    Set Test Variable              ${XML_CONTENT}

Salvando novo arquivo
    Save Xml                       ${XML_CONTENT}              ${OUTPUT}/${ID}.xml
    ${XML_FINAL}                   Get File                    ${OUTPUT}/${ID}.xml

    Log                            ${XML_FINAL}
    Set Test Variable              ${XML_FINAL}


Conferindo os dados do arquivo salvo
    Element Text Should Be         ${XML_FINAL}                ${ID}                  xpath=.//id
    Element Text Should Be         ${XML_FINAL}                ${PESSOA.nome}         xpath=.//nome
    Element Text Should Be         ${XML_FINAL}                ${PESSOA.email}        xpath=.//email

    Element Attribute Should Be    ${XML_FINAL}                status                 ${PESSOA.fixo}                           xpath=.//contato[1]
    Element Attribute Should Be    ${XML_FINAL}                tipo                   ${PESSOA.tipo}                           xpath=.//contato[2]
    Element Attribute Should Be    ${XML_FINAL}                ativo                  ${PESSOA.status}                         xpath=.//status
