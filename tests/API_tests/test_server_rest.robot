*** Settings ***
Documentation    Testes de API com Robot Framework - https://serverest.dev/#

Library    RequestsLibrary
Library    String

*** Variables ***
${BASE_URL}    https://serverest.dev

*** Test Cases ***

Fazer um consulta de usuários simples
    [Documentation]    Testa a consulta de usuários
    [Tags]    get_users
    ${response}    GET    ${BASE_URL}/usuarios    expected_status=200
    Log To Console    ${response.json()}

Fazer uma consulta de usuários params
    [Documentation]    Testa a consulta com headers e parâmetros
    [Tags]    get_users_params

    &{params}=    Create Dictionary
    ...    nome=Fulano da Silva
    ...    email=lski@emailteste.com

    ${response}    GET    ${BASE_URL}/usuarios
    ...    params=${params}
    ...    expected_status=200

    Log To Console    ${response.json()}

Cadastrar usuário por id
    [Documentation]    Testa a consulta com headers e parâmetros
    [Tags]    user_id

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

Cadastrar produto contemplando fluxo de cadastro de usuário
    [Tags]    product
    [Documentation]    Testa o fluxo de cadastro de produto  

    #gerando email randomico com a data atual
    ${timestamp}=    Get Time    epoch
    ${email}=    Catenate    SEPARATOR=    user${timestamp}    @gmail.com  

    ##cadastrar usuário
    ${DATA}=    Create Dictionary
    ...    nome=Andyts
    ...    email=${email}
    ...    password=teste123
    ...    administrador=true
    
    POST    ${BASE_URL}/usuarios
    ...    json=${DATA}
    ...    expected_status=201

    ##Fazer login
    &{DATA_LOGIN}=    Create Dictionary
    ...    email=${DATA}[email]
    ...    password=${DATA}[password]
        
    ${response}    POST    ${BASE_URL}/login
    ...    json=${DATA_LOGIN}
    ...    expected_status=200
    
    ##armazenar o token
    ${AUTHORIZATION}    Set Variable    ${response.json()['authorization']}
    
    #Cadastrar produto
    ${product_name}=    Generate Random String    8    [LETTERS]
    ${DATA_PRODUCT}=    Create Dictionary
    ...    nome=${product_name}
    ...    preco=100        
    ...    descricao= Produto de teste automatizado
    ...    quantidade=10
    
    ${HEADERS}=    Create Dictionary
    ...    Authorization=${AUTHORIZATION}
    ...    Content-Type=application/json
    
    ${response}    POST    ${BASE_URL}/produtos
    ...    json=${DATA_PRODUCT}    
    ...    headers=${HEADERS}
    ...    expected_status=201
    
Enviando requisição com templates
    [Tags]    template

    ${timestamp}=    Get Time    epoch
    ${email}=    Catenate    SEPARATOR=    user${timestamp}    @gmail.com  

    #"Ao utilizar este arquivo, altere o valor de {user_email} para o email do usuário que deseja testar. Caracteres { e } 
    # que fazem parte do payload devem ser duplicados ({{ e }})",
    ${BODY}    Format String    ${CURDIR}/data/input_users.json
    ...    user_email=${email}
    
    Log    ${BODY}

    ${body_dict}=    Evaluate    json.loads('''${BODY}''')    json

    ${response}    POST    ${BASE_URL}/usuarios
    ...    data=${body_dict}
    ...    expected_status=201
    Log   ${response.json()}