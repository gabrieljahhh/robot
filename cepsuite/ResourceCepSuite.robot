*** Settings ***
Documentation    Testes foram realizados no site: https://cepbrasil.org/
Library          SeleniumLibrary

*** Variable ***
${URL}           https://cepbrasil.org/
${BROWSER}       chrome

*** Keywords ***

Abrir navegador
    Open Browser                     about:blank                                                                        ${BROWSER}
Fechar navegador
    Close Browser

Acessar o site
    Go To                            ${URL}
    Title Should Be                  【 Busca CEP Correios 】 - Consultar CEP, Ruas, Bairros e Cidades - CEPBrasil.org

Localizar o botão com o Estado de "${estado}"
    Wait Until Element Is Visible    xpath=//div[@class='row linha']
    Click Element                    xpath=//a[@class="box"]//h4[contains(text(), "${estado}")]

Localizar o botão a Cidade de "${cidade}"
    Wait Until Element Is Visible    xpath=//div[@class='row linha']
    Click Element                    xpath=//a[@class="box"]//h4[contains(text(), "${cidade}")]

Localizar o botão com o Bairro "${bairro}"
    Wait Until Element Is Visible    xpath=//div[@class='row linha']
    Click Element                    xpath=//a[@class="box"]//h4[contains(text(), "${bairro}")]

Localizar o botão com o CEP "${cep}"
    Wait Until Element Is Visible    xpath=//div[@class='row linha']
    Click Element                    xpath=//a[@class="box"]//h4[contains(text(), "${cep}")]

Conferir informações
    Wait Until Element Is Visible    xpath=//div[@class='row linha']
    ${streetAddress}                 Get Text                                                                           //span[@itemprop="streetAddress"]
    Log                              ${streetAddress}



