*** Settings ***
Documentation    Implementação de automação em site para doações para necessidades. http://wfsweb.com/hero/
Resource         ResourceAPI.robot

Suite Setup      API Connect

*** Test Case ***
Acessar o App Be The Hero e Cadastrar uma nova ONG
    Acessar o App Be The Hero
    Clicar no botão Não tenho Cadastro
    No campo Nome da ONG: "ONG AMIGOS DA LUZ"
    No campo E-mail: "amigosdaluz@amigosdaluz.com.br"
    No campo WhatsApp: "1198765123"
    No campo Cidade: "São Paulo"
    No campo UF: "SP"
    Clicar no botão Cadastrar
    Armazenar ID que foi gerado para a ONG
    No campo Sua ID deve digitar o ID que foi gerado
    Clicar no botão Entrar
    Clicar no botão Cadastrar Novo Caso
    No campo Titulo do Caso: "Arrecadação de verba para compra de cestas basicas"
    No campo Descrição: "Estamos arrecando dinheiro para comprar cestas basicas e atender a comunidade do Jardim São em meio a Pandemia"
    No campo valor: "500.00"
    Clicar no botão Cadastrar Caso
    Clicar no Botão Logout

Acessar a API e validar as informações cadastradas pela ONG
    Validar ONG pelo ID gerado
    Verificar os Casos Cadastrados pela ONG
    Listar todas as ONGS cadastradas
    Listar todos os Casos Cadastrados



