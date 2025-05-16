*** Settings ***

Resource    ../base.robot

*** Keywords ***
Create account to email 
    Wait Until Element Is Visible   id=email_create
    ${EMAIL}                        Generate Random String
    Input Text                      id=email_create    ${EMAIL}@testerobot.com
    Log To Console                 ${EMAIL}@testerobot.com
    Click Button                   id=SubmitCreate

Clicar em "Create an account"
    Click Button    id=SubmitCreate

Preencher os dados obrigatórios
    Wait Until Element Is Visible   xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
    Click Element                   id=id_gender2
    Input Text                      id=customer_firstname    May
    Input Text                      id=customer_lastname     Fernandes
    Input Text                      id=passwd                123456

    Select From List By Value    id=days    15
    Select From List By Value    id=months  3
    Select From List By Value    id=years  1990

    Click Button                   id=submitAccount
    Wait Until Page Contains    Your account has been created.
	

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p
    Element Text Should Be           xpath=//*[@id="center_column"]/p
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           xpath=//*[@id="header"]/div[2]//div[1]/a/span    May Fernandes