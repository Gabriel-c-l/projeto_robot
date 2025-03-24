*** Settings ***
Library    SeleniumLibrary
Library    ../../libraries/FakerLibrary.py
Library    OperatingSystem
Resource   ../../resources/variables/variables.robot
Resource   ../../resources/keywords/keywords.robot



*** Test Cases ***
# ---------------------------------------------------
# Testes de Cadastro (Signup)
# ---------------------------------------------------
Cadastro - Dados Muito Longos
    [Documentation]    Preenche os campos com e-mail e senha de tamanho exagerado.
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${LONG_EMAIL}=    Evaluate    "{}@teste.com".format("a" * 100)
    ${LONG_PASSWORD}=    Evaluate    "P" * 101
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${LONG_EMAIL}
    Input Text    xpath=//input[@type='password']   ${LONG_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Capture Page Screenshot    long_cadastro.png
    Close Browser

Cadastro - Dados Muito Curtos
    [Documentation]    Preenche com e-mail mínimo e senha abaixo do tamanho esperado.
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${SHORT_EMAIL}
    Input Text    xpath=//input[@type='password']    1
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Capture Page Screenshot    curto_cadastro.png
    Close Browser

Cadastro - E-mail Incorreto
    [Documentation]    Tenta cadastro com e-mail inválido e senha incorreta.
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${INVALID_EMAIL}
    Input Text    xpath=//input[@type='password']   123
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Capture Page Screenshot    cadastro_incorreto.png
    Close Browser

Cadastro - Senha Incorreta
    [Documentation]    Tenta cadastro com e-mail inválido e senha incorreta.
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${INVALID_PASSWORD}
    Input Text    xpath=//input[@type='password']   ${INVALID_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Capture Page Screenshot    cadastro_incorreto.png
    Close Browser

Cadastro - Cadastro com E-mail e Senha 
    [Documentation]    Realiza o cadastro com e-mail e senha gerados aleatoriamente pelo Faker.
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${EMAIL}
    Input Text    xpath=//input[@type='password']    ${STRONG_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Wait Until Page Contains    Signup successful!    10s
    Capture Page Screenshot    cadastro_faker.png
    Close Browser


Cadastro - Senha Insegura
    [Documentation]    Preenche cadastro com senha considerada insegura (sem requisitos de segurança).
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${EMAIL}
    Input Text    xpath=//input[@type='password']   ${WEAK_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Capture Page Screenshot    cadastro_senha_insegura.png
    Close Browser

Cadastro - Senha Segura
    [Documentation]    Preenche cadastro com senha que atende os requisitos (letra maiúscula, número e caractere especial).
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Wait Until Element Is Visible    xpath=//input[@type='email']    10s
    Input Text    xpath=//input[@type='email']    ${EMAIL}
    Input Text    xpath=//input[@type='password']   ${STRONG_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Wait Until Page Contains    Signup successful!    10s
    Capture Page Screenshot    cadastro_senha_segura.png
    Close Browser

Cadastro - Senha Vazia
    [Documentation]    Tenta realizar o cadastro com senha vazia.
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Input Text    xpath=//input[@type='email']    ${EMAIL}
    Input Text    xpath=//input[@type='password']    ""
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Password is required')]    10s
    Capture Page Screenshot    cadastro_senha_vazia.png
    Close Browser

Cadastro - E-mail Vazio
    [Documentation]    Tenta realizar o cadastro com o e-mail vazio.
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    Input Text    xpath=//input[@type='email']    ""
    Input Text    xpath=//input[@type='password']    ${STRONG_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Email is required')]    10s
    Capture Page Screenshot    cadastro_email_vazio.png
    Close Browser

Cadastro - E-mail Duplicado
    [Documentation]    Tenta realizar o cadastro com e-mail já registrado.
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    Input Text    xpath=//input[@type='email']    ${VALID_EMAIL}
    Input Text    xpath=//input[@type='password']    ${STRONG_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Email already in use')]    10s
    Capture Page Screenshot    cadastro_email_duplicado.png
    Close Browser

Cadastro - Senha Muito Curta
    [Documentation]    Tenta realizar o cadastro com uma senha de apenas 1 caractere.
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    ${EMAIL}=    FakerLibrary.email
    Input Text    xpath=//input[@type='email']    ${EMAIL}
    Input Text    xpath=//input[@type='password']    1
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Password is too short')]    10s
    Capture Page Screenshot    cadastro_senha_curta.png
    Close Browser

Cadastro - Formato de E-mail Inválido
    [Documentation]    Tenta cadastrar um e-mail com formato inválido.
    Acessar Tela Inicial
    Acessar Tela de Cadastro
    Input Text    xpath=//input[@type='email']    teste.com
    Input Text    xpath=//input[@type='password']    ${STRONG_PASSWORD}
    Click Button    xpath=//button[contains(text(), 'Signup')]
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Invalid email format')]    10s
    Capture Page Screenshot    cadastro_email_invalido.png
    Close Browser
