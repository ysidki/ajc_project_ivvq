*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${USERNAME}       myusername
${PASSWORD}       mypassword

*** Test Cases ***
Creation_dun_compte_client_donnees_valides
    Open Browser    https://parabank.parasoft.com/parabank/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //a[text()='Rogister']
    Close Browser

Creation_dun_compte_client_donnees_non_valides
    Open Browser    https://parabank.parasoft.com/parabank/    chrome
    Maximize Browser Window
    Wait Until Page Contains    Register
    Click Element    //a[@href='register.htm' and text()='Register']
    Input Text    //input[@id='customer.firstName']    toto
    Input Text    //input[@id='customer.lastName']    xxx
    Input Text    //input[@id='customer.address.street']    xx
    Input Text    //input[@id='customer.address.city']    xx
    Input Text    //input[@id='customer.address.state']    xx
    Input Text    //input[@id='customer.address.zipCode']    xx
    Input Text    //input[@id='customer.phoneNumber']    xx
    Input Text    //input[@id='customer.ssn']    xx
    Input Text    //input[@id='customer.username']    ${USERNAME}
    Input Password    //input[@id='customer.password' and @type='password']    ${PASSWORD}
    Input Password    //input[@id='repeatedPassword' and @type='password']    tatax
    Click Element    //input[@type='submit' and @class='button' and @value='Register']
    Wait Until Page Contains Element    //span[@id='repeatedPassword.errors']    10s
    Sleep    5s
    Close Browser

Effectuer_un_transfert_dargent_cas_non_passant
    Open Browser    https://parabank.parasoft.com/parabank/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@name='username']
    Input Text    //input[@name='username']    ${USERNAME}
    Input Password    //input[@type='password']    ${PASSWORD}
    Click Element    //input[@type='submit']
    Wait Until Page Contains Element    //a[text()='Transfer Funds']
    Click Element    //a[text()='Transfer Funds']
    Sleep    10s
    Wait Until Page Contains Element    //input[@id='amount']
    Input Text    //input[@id='amount']    10
    Select From List By Index    //select[@id='fromAccountId']    0
    Select From List By Index    //select[@id='toAccountId']    0
    Click Element    //input[@type='submit']
    Wait Until Page Contains Element    //h1[@class='title' and text()='Transfer Complete!']
    Sleep    10s
    Close Browser

Effectuer_un_transfert_dargent_cas_passant
