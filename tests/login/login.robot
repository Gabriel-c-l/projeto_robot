*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../../resources/variables/variables.robot
Resource   ../../resources/keywords/keywords.robot

*** Test Cases ***
# ---------------------------------------------------
# Testes de Login
# ---------------------------------------------------
Login - Credenciais Incorretas
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    usuario@exemplo.com
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//input[@type='password']    senhaerrada123
    Click Button    xpath=//button[contains(text(), 'Login')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Invalid credentials')]    10s
    Page Should Contain    Invalid credentials
    Close Browser

Login - Conta Inexistente
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    inexistente@exemplo.com
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//input[@type='password']    senhaqualquer
    Click Button    xpath=//button[contains(text(), 'Login')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Invalid credentials')]    10s
    Page Should Contain    Invalid credentials
    Close Browser

Login - Conta Existente
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    usuario@teste.com
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//input[@type='password']    Teste@1234
    Click Button    xpath=//button[contains(text(), 'Login')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Login successful')]    10s
    Page Should Contain    Login successful
    Close Browser


Login - Campos Vazios
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${EMPTY}
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//input[@type='password']    ${EMPTY}
    Click Button    xpath=//button[contains(text(), 'Login')]
    ${email_tooltip}=    Execute JavaScript    return document.querySelector("input[type='email']").validationMessage;
    Should Be Equal As Strings    ${email_tooltip}    Preencha este campo.
    Close Browser

Login - E-mail Incorreto
    [Documentation]    Tenta realizar o login com um e-mail errado.
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    emailerrado@teste.com
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//input[@type='password']    ${VALID_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Login')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Invalid credentials')]    10s
    Page Should Contain    Invalid credentials
    Close Browser

Login - Senha Vazia
    [Documentation]    Tenta realizar o login com a senha vazia.
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${VALID_EMAIL}
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//input[@type='password']    ""
    Click Button    xpath=//button[contains(text(), 'Login')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Password is required')]    10s
    Capture Page Screenshot    login_senha_vazia.png
    Close Browser

Login - E-mail Vazio
    [Documentation]    Tenta realizar o login com o e-mail vazio.
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ""
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//input[@type='password']    ${VALID_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Login')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Email is required')]    10s
    Capture Page Screenshot    login_email_vazio.png
    Close Browser

Login - E-mail Inválido
    [Documentation]    Tenta realizar o login com um e-mail inválido.
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    teste.com
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//input[@type='password']    ${VALID_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Login')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Invalid email format')]    10s
    Capture Page Screenshot    login_email_invalido.png
    Close Browser

Login - Senha Incorreta
    [Documentation]    Tenta realizar o login com senha incorreta.
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${VALID_EMAIL}
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//input[@type='password']    senhaerrada123
    Click Button    xpath=//button[contains(text(), 'Login')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Invalid credentials')]    10s
    Capture Page Screenshot    login_senha_incorreta.png
    Close Browser

Login - E-mail Existente e Senha Correta
    [Documentation]    Realiza login com um e-mail e senha válidos.
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${VALID_EMAIL}
    Wait Until Element Is Visible    xpath=//input[@type='password']    10s
    Input Text    xpath=//input[@type='password']    ${VALID_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Login')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Login successful')]    10s
    Capture Page Screenshot    login_sucesso.png
    Close Browser
