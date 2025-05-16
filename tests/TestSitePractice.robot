*** Settings ***
Resource            ../PageObjects/base.robot
Resource            ../PageObjects/home/home.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***
Remover Produtos do Carrinho
    [Tags]    remove
    Acessar a página home do site
    To login    adnnovato@gmail.com    12345@line  
    Adicionar o produto no carrinho      Blouse
    Excluir o produto do carrinho
    Conferir se o carrinho fica vazio

### EXERCÍCIO
# Caso de Teste com PO 02: Adicionar Cliente
#     Acessar a página home do site
#     Clicar em "Sign in"
#     Informar um e-mail válido
#     Clicar em "Create an account"
#     Preencher os dados obrigatórios
#     Submeter cadastro
#     Conferir se o cadastro foi efetuado com sucesso
