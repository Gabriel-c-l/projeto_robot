*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://teste-estagiarios.vercel.app/
${BROWSER}    Chrome
${EMAIL}    usuario@teste.com
${SENHA}    Teste@1234

*** Test Cases ***
Criar Usuário e Clicar em Signup
    # Abre o navegador e acessa a URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Clica em "Password-based Authentication"
    Wait Until Element Is Visible    xpath=//a[@href='/password/login']    10s
    Click Element    xpath=//a[@href='/password/login']

    # Clica em "Create a new account"
    Wait Until Element Is Visible    xpath=//a[@href='/password/signup']    10s
    Click Element    xpath=//a[@href='/password/signup']

    # Preenche os campos de cadastro
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${EMAIL}
    Input Text    xpath=//input[@type='password']    ${SENHA}

    # Clica no botão "Signup"
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'Signup')]    10s
    Click Button    xpath=//button[contains(text(), 'Signup')]

    # Verifica se o cadastro foi bem-sucedido
    Wait Until Page Contains    Welcome!    10s
    Page Should Contain    Signup successful!

    # Fecha o navegador
    Close Browser