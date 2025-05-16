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
    Register Keyword To Run On Failure    No Operation


Fechar navegador
    Capture Page Screenshot    ${EXECDIR}/results/${SUITE_NAME}/${TEST_NAME}.png
    Close Browser