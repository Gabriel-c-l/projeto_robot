*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    OperatingSystem
Resource   ../variables/variables.robot


*** Keywords ***
Acessar Tela Inicial
    [Documentation]    Abre o navegador, maximiza a janela e clica no botão "Password-based Authentication."
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${XPATH_PASSWORD_AUTH}    10s
    Click Element    ${XPATH_PASSWORD_AUTH}

Acessar Tela de Cadastro
    [Documentation]    Clica no botão "Create a new account" para acessar a tela de cadastro.
    Wait Until Element Is Visible    ${XPATH_CREATE_ACCOUNT}    10s
    Click Element    ${XPATH_CREATE_ACCOUNT}

Preencher Campos
    [Arguments]    ${email}    ${senha}
    [Documentation]    Preenche os campos de e-mail e senha no formulário de login.
    Wait Until Element Is Visible    ${XPATH_EMAIL_INPUT}    10s
    Input Text    ${XPATH_EMAIL_INPUT}    ${email}
    Wait Until Element Is Visible    ${XPATH_PASSWORD_INPUT}    10s
    Input Text    ${XPATH_PASSWORD_INPUT}    ${senha}

Clicar Botão Login
    [Documentation]    Clica no botão de login.
    Click Button    ${XPATH_LOGIN_BUTTON}

Clicar Botão Signup
    [Documentation]    Clica no botão de cadastro (Signup).
    Click Button    ${XPATH_SIGNUP_BUTTON} 

Verificar Mensagem
    [Arguments]    ${mensagem}
    [Documentation]    Verifica se a mensagem esperada está presente na página.
    Wait Until Element Is Visible    xpath=//p[contains(text(), '${mensagem}')]    10s
    Page Should Contain    ${mensagem}

Verificar Tooltip
    [Arguments]    ${campo}    ${mensagem}
    [Documentation]    Verifica o tooltip de validação de um campo.
    ${tooltip}=    Execute JavaScript    return document.querySelector("input[name='${campo}']").validationMessage;
    Should Be Equal As Strings    ${tooltip}    ${mensagem}

Verificar Redirecionamento Cadastro
    [Documentation]    Verifica se o redirecionamento após cadastro foi bem-sucedido.
    Wait Until Element Is Visible    ${XPATH_WELCOME_MESSAGE}    15s
    Wait Until Element Is Visible    ${XPATH_BACK_TO_LOGIN}    10s

Fechar Navegador
    [Documentation]    Fecha o navegador.
    Close Browser
