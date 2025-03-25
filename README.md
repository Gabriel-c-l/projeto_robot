# Documentação do Projeto Robot Framework

## Introdução
Este projeto utiliza o **Robot Framework** para a execução de testes automatizados. O objetivo é facilitar a verificação da funcionalidade do sistema, garantindo qualidade e eficiência nos testes.

## Requisitos
Antes de iniciar, certifique-se de ter os seguintes itens instalados:

- **Python** (versão 3.x recomendada)
- **Robot Framework**
- **Bibliotecas adicionais:**
  - robotframework-seleniumlibrary
  - robotframework-requests
  - robotframework-jsonlibrary
  - robotframework-datadriver
  - robotframework-faker  

Para instalar todas as bibliotecas necessárias, execute:
```sh
pip install -r requirements.txt
```

## Instalação
1. Clone este repositório:
   ```sh
   git clone <URL_DO_REPOSITORIO>
   ```
2. Acesse o diretório do projeto:
   ```sh
   cd projeto_robot
   ```
3. Instale as dependências:
   ```sh
   pip install -r requirements.txt
   ```

## Execução dos Testes
Para rodar os testes, utilize um dos seguintes comandos:

1. Utilizando o comando padrão do Robot Framework:
   ```sh
   robot tests/
   ```
2. Executando diretamente com Python:
   ```sh
   python -m robot.run -d results tests/cadastro.robot
   ou
   python -m robot.run -d results tests/cadastro/cadastro.robot
   ```

Se houver arquivos de configuração específicos, adicionar instruções aqui.

## Estrutura do Projeto
```
projeto_robot/
|-- tests/                # Casos de teste do Robot Framework
|-- resources/            # Arquivos de suporte (ex: keywords customizadas)
|-- results/              # Relatórios de execução
|-- robot_test_runner.py  # Script para facilitar a execução dos testes
|-- README.md             # Documentação do projeto
```

---

