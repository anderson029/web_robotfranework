*** Settings ***

Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://serverest.dev

*** Test Cases ***

Fazer um consulta de usuários simples
    [Documentation]    Testa a consulta de usuários
    [Tags]    API
    ${response}    GET    ${BASE_URL}/usuarios    expected_status=200
    Log To Console    ${response.json()}

Fazer uma consulta de usuários params
    [Documentation]    Testa a consulta com headers e parâmetros
    [Tags]    GET

    &{params}=    Create Dictionary
    ...    nome=Fulano da Silva
    ...    email=lski@emailteste.com

    ${response}    GET    ${BASE_URL}/usuarios
    ...    params=${params}
    ...    expected_status=200

    Log To Console    ${response.json()}

Cadastrar usuário e fazer uma consulta pelo id
    [Documentation]    Testa a consulta com headers e parâmetros
    [Tags]    POST

    &{DATA}=    Create Dictionary
    ...    nome=Lima5
    ...    email=andy115@qa.com.br
    ...    password=teste123
    ...    administrador=true
    
    ${response}    POST    ${BASE_URL}/usuarios
    ...    json=${DATA}
    ...    expected_status=201
    
    Log    ${response.json()}
    ${id}    Set Variable    ${response.json()['_id']}

    &{params}=    Create Dictionary
    ...    _id=${id}  

    ${response}    GET    ${BASE_URL}/usuarios
    ...    params=${params}
    ...    expected_status=200
    
    Log    ${response.json()['usuarios'][0]['nome']}