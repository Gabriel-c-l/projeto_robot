*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    OperatingSystem

*** Variables ***
${URL}    https://teste-estagiarios.vercel.app/
${BROWSER}    Chrome
${SENHA}    Teste@1234
${EMAIL_FILE}    email_gerado.txt

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

    # Gera um e-mail falso e salva em um arquivo
    ${EMAIL}  FakerLibrary.email
    Create File    ${EMAIL_FILE}    ${EMAIL}

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

Realizar Login
    # Lê o e-mail salvo no arquivo
    ${EMAIL}    Get File    ${EMAIL_FILE}

    # Abre o navegador e acessa a URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Clica em "Password-based Authentication"
    Wait Until Element Is Visible    xpath=//a[@href='/password/login']    10s
    Click Element    xpath=//a[@href='/password/login']

    # Preenche os campos de login
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${EMAIL}
    Input Text    xpath=//input[@type='password']    ${SENHA}

    # Clica no botão "Login"
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'Login')]    10s
    Click Button    xpath=//button[contains(text(), 'Login')]

     # Verifica se o login foi bem-sucedido
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'bg-white') and contains(., 'Welcome!')]    10s
    Element Should Contain    xpath=//div[contains(@class, 'bg-white') and contains(., 'Welcome!')]    Login successful


    # Fecha o navegador
    Close Browser