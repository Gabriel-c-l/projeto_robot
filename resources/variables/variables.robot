*** Variables ***
${URL}             https://teste-estagiarios.vercel.app/
${BROWSER}         Chrome
${VALID_EMAIL}     usuario@teste.com
${VALID_PASSWORD}  Teste@1234
${INVALID_EMAIL}   emailerrado@teste
${INVALID_PASSWORD}   @ @#
${SHORT_EMAIL}     1@1.c
${WEAK_PASSWORD}   teste1234
${STRONG_PASSWORD}     Teste@1234

# Variáveis específicas para cadastro
${SIGNUP_SUCCESS_MESSAGE}    Signup successful!
${EMAIL_ALREADY_IN_USE}      User already exists
${INVALID_EMAIL_FORMAT}      Invalid email format
${PASSWORD_TOO_SHORT}        Password is too short
${WELCOME_MESSAGE}           Welcome!
${BACK_TO_LOGIN_TEXT}        Back to login

# Variáveis específicas para login
${LOGIN_SUCCESS_MESSAGE}     Login successful
${INVALID_CREDENTIALS}       Invalid credentials
${EMAIL_REQUIRED}            Email is required
${PASSWORD_REQUIRED}         Password is required
${INVALID_EMAIL_TOOLTIP}     Inclua um "@" no endereço de e-mail.
${EMAIL_VALIDATION_MESSAGE}  Preencha este campo.

# Variáveis de elementos (XPath)
${XPATH_PASSWORD_AUTH}       xpath=//p[contains(text(), 'Password-based Authentication.')]
${XPATH_CREATE_ACCOUNT}      xpath=//a[@href='/password/signup']
${XPATH_EMAIL_INPUT}         xpath=//input[@type='email']
${XPATH_PASSWORD_INPUT}      xpath=//input[@type='password']
${XPATH_SIGNUP_BUTTON}       xpath=//button[contains(text(), 'Signup')]
${XPATH_LOGIN_BUTTON}        xpath=//button[contains(text(), 'Login')]
${XPATH_WELCOME_MESSAGE}     xpath=//p[contains(@class, 'text-green-500') and contains(text(), '${WELCOME_MESSAGE}')]
${XPATH_BACK_TO_LOGIN}       xpath=//a[@href='/password/login']//p[contains(@class, 'text-blue-500') and normalize-space(text())='${BACK_TO_LOGIN_TEXT}']
