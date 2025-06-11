# IMB Itaú - Guia de Configuração

Este documento orienta o passo-a-passo para configurar o _Itaú Mail Box_ (IMB), uma solução de transferência de arquivos gerenciada pelo Itaú, que permite a troca segura de dados entre empresas e o banco. Este guia cobre desde a instalação até a configuração inicial do IMB em um ambiente Docker.

## Pré-requisitos
- **Docker**: Certifique-se de que o Docker esteja instalado e funcionando corretamente em seu sistema.

- **Chave Privada**: Você deve ter uma chave privada (`id_rsa_itau`) para autenticação com o Itaú. Esta chave deve estar localizada no diretório `Keys` dentro do diretório do IMB.

- **Arquivo de Configuração**: O arquivo `config.json` deve estar configurado corretamente com as informações do seu ambiente.

- **Arquivo de Jobs**: O arquivo `job.txt` deve conter os jobs que você deseja executar, conforme o formato especificado na documentação do Itaú.

- **Arquivo de Chaves Autorizadas**: O arquivo `authorizedkeys.txt` deve conter as chaves públicas autorizadas para acesso.

- **Variáveis de Ambiente**: Você pode definir as variáveis de ambiente `IMB_USER` e `IMB_PASS` para personalizar o usuário e senha utilizados pelo IMB.

