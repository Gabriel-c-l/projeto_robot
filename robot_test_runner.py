import os
import sys
from robot import run

def main():
    # Diretório dos testes
    test_dir = os.path.join(os.path.dirname(__file__), "tests")
    
    # Diretório dos resultados
    results_dir = os.path.join(os.path.dirname(__file__), "results")
    
    # Criar diretório de resultados se não existir
    os.makedirs(results_dir, exist_ok=True)
    
    # Executar os testes
    exit_code = run(test_dir, outputdir=results_dir)
    
    # Retornar código de saída adequado
    sys.exit(exit_code)

if __name__ == "__main__":
    main()
