*** Settings ***
Resource    ../Base.robot

*** Keywords ***
To login
    [Arguments]        ${EMAIL}    ${PASSWORD}
    
    # Wait Until Page Contains    Log in to your customer account
    Click Element       xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]
    Input Text    xpath=//*[@id='email']     ${EMAIL}  
    Input Text    xpath=//*[@id='passwd']     ${PASSWORD} 
    Click Button    id=SubmitLogin
    Wait Until Page Contains    My account