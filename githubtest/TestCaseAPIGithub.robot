*** Settings ***
Documentation    API github Users
Resource         ResourceAPI.robot
Suite Setup      API Connect



*** Test Case ***
Buscar um usuário cadastrado no github
    Buscar pelo usuário cadastro como: 'gabrieljahhh' no github
    Verificar o status code '200'



