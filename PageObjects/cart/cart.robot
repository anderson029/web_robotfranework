*** Settings ***
Resource    ../base.robot 
 
*** Keywords ***

To go cart
    Wait Until Element Is Visible    xpath=//*[@title="View my shopping cart"]    10s
    Click Element                    xpath=//*[@title="View my shopping cart"]

# Adicionar o produto no carrinho
#     # Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
#     # Clicar no botão pesquisar    
#     # Clicar no botão "Add to Cart" do produto
#     # Clicar no botão "Proceed to checkout"

#     Wait Until Element Is Visible    xpath=//*[@title="View my shopping cart"]    10s
#     Click Element                    xpath=//*[@title="View my shopping cart"]



#     Input Text          name=search_query    ${PRODUTO}
#     Click Element       name=submit_search

# Adicionar o produto "${PRODUTO}" no carrinho
