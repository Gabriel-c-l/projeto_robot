# Guia de Instalação e Execução do Projeto Robot Framework

Este documento descreve os passos necessários para configurar e executar o projeto de testes automatizados utilizando **Robot Framework**.

---

## **Pré-requisitos**

Antes de rodar o projeto, certifique-se de ter os seguintes itens instalados:

1. **Python** (versão 3.8 ou superior)
   - Baixe e instale em: [https://www.python.org/downloads/](https://www.python.org/downloads/)
   - Certifique-se de que o Python está no PATH do sistema

2. **Gerenciador de pacotes `pip` atualizado**
   ```sh
   python -m pip install --upgrade pip setuptools
   ```

3. **Robot Framework e dependências**
   ```sh
   pip install robotframework robotframework-seleniumlibrary robotframework-faker
   ```

4. **Drivers para testes web (se necessário)**
   - Se estiver testando aplicações web, instale o **WebDriver** do navegador correspondente.
   - Para o Chrome, instale o **ChromeDriver**: [https://sites.google.com/chromium.org/driver/](https://sites.google.com/chromium.org/driver/)

---

## **Configuração do Ambiente**

### **1. Definir a variável `robot.pythonpath` no VS Code (Opcional)**
Se estiver utilizando o **VS Code**, é necessário configurar corretamente o **robot.pythonpath**:

1. No VS Code, abra o **Command Palette** (`Ctrl + Shift + P`) e pesquise `Preferences: Open Settings (JSON)`.
2. Adicione ou edite o seguinte trecho:
   ```json
   "robot.pythonpath": [
       "C:\\Users\\SEU_USUARIO\\AppData\\Local\\Programs\\Python\\PythonXXX\\Lib\\site-packages"
   ]
   ```
3. Depois, limpe o cache do Robot Framework:
   - Abra o **Command Palette** (`Ctrl + Shift + P`)
   - Digite **"Robot Framework: Clear caches and restart"** e execute.

### **2. Rodar os testes**
Dentro do diretório do projeto, utilize o seguinte comando:
```sh
robot exemplo_teste.robot
```
Ou, caso o comando `robot` não seja reconhecido:
```sh
python -m robot exemplo_teste.robot
```

---

## **Possíveis Erros e Soluções**

### **Erro: `robot: comando não encontrado`**
**Causa:** O Robot Framework pode não estar corretamente instalado ou não está no PATH do sistema.

**Solução:**
1. Confirme se o Robot Framework está instalado:
   ```sh
   pip show robotframework
   ```
2. Se não estiver instalado, execute:
   ```sh
   pip install robotframework
   ```
3. Caso o erro persista, tente rodar os testes usando:
   ```sh
   python -m robot exemplo_teste.robot
   ```

### **Erro: `ModuleNotFoundError: No module named 'FakerLibrary'`**
**Causa:** A biblioteca **FakerLibrary** pode não estar instalada corretamente ou não está sendo reconhecida.

**Solução:**
1. Instale (ou reinstale) a biblioteca:
   ```sh
   pip install --upgrade robotframework-faker
   ```
2. Se o erro persistir, adicione o caminho correto ao `robot.pythonpath` no VS Code (veja a seção de configuração acima).

### **Erro: `Importing library 'FakerLibrary' failed: No module named 'pkg_resources'`**
**Causa:** O pacote **setuptools** pode estar desatualizado ou ausente.

**Solução:**
```sh
pip install --upgrade setuptools
```

### **Erro: `chromedriver` não encontrado**
**Causa:** Se os testes utilizam **SeleniumLibrary**, é necessário instalar o **WebDriver** correspondente ao navegador em uso.

**Solução:**
1. Baixe o ChromeDriver: [https://sites.google.com/chromium.org/driver/](https://sites.google.com/chromium.org/driver/)
2. Adicione o diretório do **ChromeDriver** ao PATH do sistema.

---

## **Conclusão**

Agora o ambiente está pronto para rodar os testes automatizados com **Robot Framework**. Caso encontre novos erros, verifique as mensagens de erro e tente reinstalar as dependências necessárias.

Para dúvidas ou melhorias, entre em contato com o responsável pelo projeto.

---
**Desenvolvido por:** Gabriel

------------------------------------------------------------------------
robot -d result -t "Criar Usuário e Clicar em Signup" exemplo_teste.robot