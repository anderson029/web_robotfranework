*** Settings ***

Resource    ../base.robot 
Resource    ../cart/cart.robot

*** Variables ***
${URL}          http://www.automationpractice.pl/index.php

*** Keywords ***

Acessar a página home do site
    Go To               ${URL}
    Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul
    Title Should Be     My Shop


Consultar produto disponível
    [Arguments]        ${PRODUTO}
    Wait Until Element Is Visible   xpath=//*[@id="search_query_top"]
    Input Text          name=search_query    ${PRODUTO}
    Click Element       name=submit_search

To go Authentication
    Click Element    xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]