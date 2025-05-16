*** Settings ***
Resource    ../base.robot 
 
*** Keywords ***

To go cart
    Wait Until Element Is Visible    xpath=//*[@title="View my shopping cart"]
    Click Element                    xpath=//*[@title="View my shopping cart"]
    Page Should Contain    Shopping-cart summary

Conferir se o carrinho fica vazio
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    Your shopping cart is empty.

Excluir o produto do carrinho
    Wait Until Page Contains    Shopping-cart summary
    Click Element    xpath=//*[@title='Delete']
