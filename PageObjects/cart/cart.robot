*** Settings ***
Resource    ../base.robot 
 
*** Keywords ***

To go cart
    Wait Until Element Is Visible    xpath=//*[@title="View my shopping cart"]
    Click Element                    xpath=//*[@title="View my shopping cart"]
    Page Should Contain    Shopping-cart summary

Excluir o produto do carrinho
    Wait Until Page Contains    Shopping-cart summary
    Click Element    xpath=//*[@title='Delete']
    Conferir se o carrinho fica vazio

Conferir se o carrinho fica vazio
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    Your shopping cart is empty.

Adicionar o produto no carrinho    
    [Arguments]        ${PRODUTO}
    ${elemento_visivel} =    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    xpath=//img[@itemprop='image'][@alt='${PRODUTO}']    5
    
    IF    not ${elemento_visivel}      
        Fail    msg=Produto não encontrado: ${PRODUTO}
    ELSE
        Click Element    xpath=//img[@itemprop='image'][@alt='${PRODUTO}']
        Log To Console    Produto encontrado: ${PRODUTO}
    END

    Wait Until Page Contains    Data sheet    5
    Click Element    id=color_8
    Wait Until Page Contains    In stock    5
    Click Element    id=add_to_cart
    Wait Until Page Contains    Product successfully added to your shopping cart    5
    To go cart
