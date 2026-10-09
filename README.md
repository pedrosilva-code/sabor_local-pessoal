# 🍲 Sabor Local - Mobile Application

O **Sabor Local** é uma plataforma mobile focada na descoberta e pedido de sabores locais e regionais. A aplicação conta com um fluxo seguro de autenticação, validação de utilizadores via código OTP por e-mail e gestão de dados cadastrais e de endereço.

---

## 🛠️ Arquitetura e Tecnologias

- **Frontend / Interface:** [FlutterFlow](https://flutterflow.io) (Flutter)
- **Backend / Database / REST API:** [Xano](https://xano.com) (No-SQL/Relational Backend)
- **Serviço de E-mail / Transacional:** [Twilio SendGrid](https://sendgrid.com) (Dynamic Templates)
- **Serviço de Endereços:** Integrado via API externa ([ViaCEP](https://viacep.com.br))

---

## 📱 Fluxo de Telas (FlutterFlow)

A aplicação segue um fluxo contínuo de registo e validação de utilizadores:

1. **`TelaInicial` (Login):**
   - Entrada de e-mail e palavra-passe.
   - Botão para navegar até à `TelaCadastro`.

2. **`TelaCadastro` (Registo de Utilizador):**
   - Recolha dos dados: Nome Completo, CPF, E-mail, Celular e Palavra-passe.
   - Envio dos dados para a API do Xano e geração automática do código OTP.

3. **`TelaValidacao` (Verificação OTP):**
   - Campo estilo *PinCode* para digitação do código de 6 dígitos.
   - O e-mail é recebido dinamicamente via **Page Parameter** da tela anterior.
   - Verificação em tempo real via endpoint `/validarotp`.

4. **`TelaEndereco` (Gestão de Endereço):**
   - Preenchimento do endereço com busca por CEP.
   - Injeção automática da chave de relacionamento `cliente_id` no backend.

---

## 🗄️ Estrutura da Base de Dados (Xano)

O backend possui uma arquitetura relacional entre tabelas principais e de suporte:

### Tabelas Principais:
- **`user` / `CLIENTES`:** Guarda os dados fundamentais do utilizador (`nome`, `cpf`, `email`, `celular`, `password`, `codigo_opt`, `data_expiracao`).
- **`ENDERECO`:** Guarda os endereços associados via `cliente_id` (*Table Reference* para `CLIENTES` / `user`).
- **`PEDIDO` / `ITEM` / `PRODUTO`:** Estrutura para gestão de compras, itens do carrinho e produtos disponíveis.

### Tabelas de Estado / Suporte:
- `STATUS_CLIENTES`, `STATUS_PEDIDO`, `STATUS_ITEM`, `STATUS_OS`.
- `TIPOENDERECO`, `CARTOESTOKENIZADO`, `SOLCANCELAMENTO`, `RESTORNO`.

---

## ✉️ Integração Transacional (SendGrid)

- **Template Dinâmico:** `Email-SaborLocal`
- **Funcionamento:**
  1. Durante o registo no Xano, um código OTP é gerado.
  2. O Xano chama a API do SendGrid enviando o e-mail de destino e o código de verificação.
  3. O utilizador recebe o e-mail estilizado com o código temporário para validação.

---

## 🔄 Endpoints Principais (REST APIs)

| Método | Endpoint | Descrição |
| :--- | :--- | :--- |
| **POST** | `/auth/signup` | Cria o utilizador e aciona o envio de OTP via SendGrid. |
| **POST** | `/validarotp` | Valida o código digitado (`email` + `codigo_digitado`) e ativa a conta. |
| **POST** | `/endereco` | Cadastra o endereço vinculando automaticamente ao cliente autenticado (`cliente_id`). |

---

## 📌 Histórico de Alterações Recentes (Changelog)

- **Otimização do Payload do Endereço:** Remoção da exigência manual de `cliente_id` no frontend, delegando a associação ao `auth.id` ou ao retorno da inserção no Xano.
- **Simplificação de CEP:** Substituição da tabela auxiliar `cep_id` por armazenamento direto da *string* de CEP para integração dinâmica com o ViaCEP.
- **Ajuste de JSON no FlutterFlow:** Correção na passagem de variáveis dinâmicas no Body da requisição `/validarotp` (remoção de aspas literais).
- **Parâmetros de Navegação:** Configuração de repasse automático do e-mail da `TelaCadastro` para a `TelaValidacao`.
