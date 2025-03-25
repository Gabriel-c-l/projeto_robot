*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../../resources/variables/variables.robot
Resource   ../../resources/keywords/keywords.robot

*** Test Cases ***
# ---------------------------------------------------
# Testes de Login
# ---------------------------------------------------

# Cenário 4: Login bem-sucedido
Login - Conta Existente
    Acessar Tela Inicial
    Preencher Campos    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Clicar Botão Login
    Verificar Mensagem    ${LOGIN_SUCCESS_MESSAGE}
    Fechar Navegador

# Cenário 5: Login com credenciais erradas
Login - Credenciais Incorretas
    Acessar Tela Inicial
    Preencher Campos    ${VALID_EMAIL}    ${INVALID_PASSWORD}
    Clicar Botão Login
    Verificar Mensagem    ${INVALID_CREDENTIALS}
    Fechar Navegador

# Cenário 6: Login com conta inexistente
Login - Conta Inexistente
    Acessar Tela Inicial
    Preencher Campos    inexistente@exemplo.com    senhaqualquer
    Clicar Botão Login
    Verificar Mensagem    ${INVALID_CREDENTIALS}
    Fechar Navegador

# Cenários Extras
Login - Campos Vazios
    Acessar Tela Inicial
    Preencher Campos    ${EMPTY}    ${EMPTY}
    Clicar Botão Login
    ${email_tooltip}=    Execute JavaScript    return document.querySelector("input[type='email']").validationMessage;
    Should Be Equal As Strings    ${email_tooltip}    ${EMAIL_VALIDATION_MESSAGE}
    Fechar Navegador

Login - E-mail Incorreto
    Acessar Tela Inicial
    Preencher Campos    ${INVALID_EMAIL}    ${VALID_PASSWORD}
    Clicar Botão Login
    Wait Until Element Is Visible    xpath=//p[contains(text(), '${INVALID_CREDENTIALS}')]    10s
    Page Should Contain    ${INVALID_CREDENTIALS}
    Fechar Navegador

Login - Senha Vazia
    Acessar Tela Inicial
    Preencher Campos    ${VALID_EMAIL}    ${EMPTY}
    Clicar Botão Login
    ${mensagem}=    Execute JavaScript    return document.querySelector("input[type='password']").validationMessage;
    Log    ${mensagem}
    Capture Page Screenshot    login_senha_vazia.png
    Fechar Navegador

Login - E-mail Vazio
    Acessar Tela Inicial
    Preencher Campos    ${EMPTY}    ${VALID_PASSWORD}
    Clicar Botão Login
    ${mensagem}=    Execute JavaScript    return document.querySelector("input[type='email']").validationMessage;
    Log    ${mensagem}
    Capture Page Screenshot    login_email_vazio.png
    Fechar Navegador

Login - E-mail Inválido
    Acessar Tela Inicial
    Preencher Campos    teste.com    ${VALID_PASSWORD}
    Clicar Botão Login
    ${mensagem}=    Execute JavaScript    return document.querySelector("input[type='email']").validationMessage;
    Log    ${mensagem}
    Capture Page Screenshot    login_email_invalido.png
    Fechar Navegador

Login - Senha Incorreta
    Acessar Tela Inicial
    Preencher Campos    ${VALID_EMAIL}    senhaerrada123
    Clicar Botão Login
    Wait Until Element Is Visible    xpath=//p[contains(text(), '${INVALID_CREDENTIALS}')]    10s
    Capture Page Screenshot    login_senha_incorreta.png
    Fechar Navegador

Login - E-mail Existente e Senha Correta
    Acessar Tela Inicial
    Preencher Campos    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Clicar Botão Login
    Wait Until Element Is Visible    xpath=//p[contains(text(), '${LOGIN_SUCCESS_MESSAGE}')]    10s
    Capture Page Screenshot    login_sucesso.png
    Fechar Navegador

Login - Redirecionamento Após Sucesso
    Acessar Tela Inicial
    Preencher Campos    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Clicar Botão Login
    Wait Until Page Contains    Welcome!    10s
    Wait Until Page Contains    ${LOGIN_SUCCESS_MESSAGE}    10s
    Capture Page Screenshot    login_redirecionamento_sucesso.png
    Fechar Navegador
