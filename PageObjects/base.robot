*** Settings ***
Library    SeleniumLibrary
...    timeout=5.0                   
...    screenshot_root_directory=None 
Library    String

*** Variables ***
${BROWSER}      chrome

*** Keywords ***

#### Setup e Teardown
Abrir navegador
    Open Browser        about:blank   ${BROWSER}
    Maximize Browser Window
    # Register Keyword To Run On Failure    No Operation

To login
    [Arguments]        ${EMAIL}    ${PASSWORD}
    
    # Wait Until Page Contains    Log in to your customer account
    Click Element       xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]
    Input Text    xpath=//*[@id='email']     ${EMAIL}  
    Input Text    xpath=//*[@id='passwd']     ${PASSWORD} 
    Click Button    id=SubmitLogin
    Wait Until Page Contains    My account

Fechar navegador
    Capture Page Screenshot    ${EXECDIR}/results/${SUITE_NAME}/${TEST_NAME}.png
    Close Browser