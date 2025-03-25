*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    OperatingSystem
Resource   ../../resources/variables/variables.robot
Resource   ../../resources/keywords/keywords.robot

*** Test Cases ***
# ---------------------------------------------------
# Testes de Cadastro (Signup)
# ---------------------------------------------------

# Cenário 1: Cadastro bem-sucedido
Cadastro - Cadastro com E-mail e Senha
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Preencher Campos     ${EMAIL}    ${STRONG_PASSWORD}
    Clicar Botão Signup
    Verificar Redirecionamento Cadastro
    Capture Page Screenshot    cadastro_faker.png
    Fechar Navegador

# Cenário 2: Campos obrigatórios
Cadastro - Senha Vazia
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Preencher Campos    ${EMAIL}    ${EMPTY}
    Clicar Botão Signup
    Wait Until Element Is Visible    xpath=//input[@type='password'][@required]    10s
    Capture Page Screenshot    cadastro_senha_vazia.png
    Fechar Navegador

Cadastro - E-mail Vazio
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    Preencher Campos    ${EMPTY}    ${STRONG_PASSWORD}
    Clicar Botão Signup
    Wait Until Element Is Visible    xpath=//input[@type='email'][@required]    10s
    Capture Page Screenshot    cadastro_email_vazio.png
    Fechar Navegador

# Cenário 3: Validação do formato do E-mail
Cadastro - Formato de E-mail Inválido
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    Preencher Campos    teste.com    ${STRONG_PASSWORD}
    Clicar Botão Signup
    Wait Until Element Is Visible    xpath=//input[@type='email'][@required]    10s
    Capture Page Screenshot    cadastro_email_invalido.png
    Fechar Navegador

# Cenários Extras
Cadastro - Dados Muito Longos
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${LONG_EMAIL}=    Evaluate    "{}@teste.com".format("a" * 100)
    ${LONG_PASSWORD}=    Evaluate    "P" * 101
    Preencher Campos    ${LONG_EMAIL}    ${LONG_PASSWORD}
    Clicar Botão Signup
    Capture Page Screenshot    long_cadastro.png
    Fechar Navegador

Cadastro - Dados Muito Curtos
    Acessar Tela Inicial
    Wait Until Element Is Visible    xpath=//a[@href='/password/signup']    10s
    Acessar Tela de Cadastro
    Preencher Campos    ${SHORT_EMAIL}    1
    Clicar Botão Signup
    Capture Page Screenshot    curto_cadastro.png
    Fechar Navegador

Cadastro - E-mail Duplicado
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    Preencher Campos    ${VALID_EMAIL}    ${STRONG_PASSWORD}
    Clicar Botão Signup
    Wait Until Element Is Visible    xpath=//p[contains(@class, 'text-center') and contains(@class, 'text-red-500') and contains(text(), 'User already exists')]    10s
    Capture Page Screenshot    cadastro_email_duplicado.png
    Fechar Navegador

Cadastro - Senha Muito Curta
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Preencher Campos    ${EMAIL}    1
    Clicar Botão Signup
    Capture Page Screenshot    cadastro_senha_curta.png
    Fechar Navegador

Cadastro - Senha Insegura
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Preencher Campos    ${EMAIL}    ${WEAK_PASSWORD}
    Clicar Botão Signup
    Capture Page Screenshot    cadastro_senha_insegura.png
    Fechar Navegador

Cadastro - Senha Segura
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Preencher Campos    ${EMAIL}    ${STRONG_PASSWORD}
    Clicar Botão Signup
    Wait Until Page Contains    ${SIGNUP_SUCCESS_MESSAGE}    10s
    Capture Page Screenshot    cadastro_senha_segura.png
    Fechar Navegador

Cadastro - Redirecionamento Após Sucesso
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Preencher Campos    ${EMAIL}    ${STRONG_PASSWORD}
    Clicar Botão Signup
    Verificar Redirecionamento Cadastro
    Capture Page Screenshot    cadastro_redirecionamento_sucesso.png
    Fechar Navegador

Cadastro e login - Email e senha
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Preencher Campos    ${EMAIL}    ${STRONG_PASSWORD}
    Clicar Botão Signup
    Verificar Mensagem    ${SIGNUP_SUCCESS_MESSAGE}
    Verificar Redirecionamento Cadastro
    Click Element    ${XPATH_BACK_TO_LOGIN}
    Preencher Campos    ${SHORT_EMAIL}    1
    Clicar Botão Login
    Verificar Mensagem    ${LOGIN_SUCCESS_MESSAGE}
    Capture Page Screenshot    curto_cadastro.png
    Fechar Navegador