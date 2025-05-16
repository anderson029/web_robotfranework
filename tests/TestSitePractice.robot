*** Settings ***
Resource            ../PageObjects/base.robot
Resource            ../PageObjects/home/home.robot
Resource            ../PageObjects/Authentication/create_account.robot
Resource            ../PageObjects/Authentication/login.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***
Remover Produtos do Carrinho
    [Tags]    remove
    Acessar a página home do site
    To login    adnnovato@gmail.com    12345@line  
    Consultar produto disponível     Blouse
    Adicionar o produto no carrinho      Blouse
    Excluir o produto do carrinho

Adicionar Cliente
    [Tags]    create_user
    Acessar a página home do site
    To go Authentication
    Create account to email    
    Preencher os dados obrigatórios
  
