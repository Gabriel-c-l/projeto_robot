*** Keywords ***
Acessar Tela Inicial
    [Documentation]    Abre o navegador, maximiza a janela e clica no botão "Password-based Authentication."
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Password-based Authentication.')]    10s
    Click Element    xpath=//p[contains(text(), 'Password-based Authentication.')]

Acessar Tela de Cadastro
    [Documentation]    Clica no botão "Create a new account" para acessar a tela de cadastro.
    Wait Until Element Is Visible    xpath=//a[@href='/password/signup']    10s
    Click Element    xpath=//a[@href='/password/signup']
