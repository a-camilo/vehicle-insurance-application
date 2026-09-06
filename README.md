# vehicle-insurance-application
# 🚗 Vehicle Insurance — Test Automation

Projeto de automação de testes para a aplicação **Vehicle Insurance**, disponibilizada pela Tricentis para fins de estudo e prática de testes de software.

O projeto utiliza **BDD (Behavior Driven Development)** para descrever os comportamentos da aplicação em linguagem Gherkin e **Selenium WebDriver** para automatização dos testes funcionais.

---

## 🌐 Aplicação

**Vehicle Insurance Application**

[Acessar aplicação](https://sampleapp.tricentis.com/101/app.php?utm_source=chatgpt.com)

A aplicação permite realizar uma cotação de seguro automotivo através de um fluxo dividido em diferentes etapas:

```text
Vehicle Data
     ↓
Insurant Data
     ↓
Product Data
     ↓
Price Option
     ↓
Send Quote
```

---

## 🎯 Objetivo do projeto

O objetivo é desenvolver uma suíte de testes automatizados capaz de validar o fluxo de cotação de seguro, contemplando diferentes estratégias de teste.

Principais objetivos:

* Validar regras funcionais da aplicação.
* Validar campos obrigatórios.
* Validar dados inválidos.
* Validar navegação entre etapas.
* Validar cálculo e apresentação dos valores.
* Validar seleção dos planos.
* Validar geração da cotação.
* Validar envio da cotação.
* Automatizar o fluxo principal de ponta a ponta.
* Criar uma estrutura preparada para testes de regressão.

---

## 🧪 Estratégia de testes

A estratégia contempla diferentes tipos de testes:

### Testes funcionais

Validação das funcionalidades individuais da aplicação.

### Testes negativos

Validação do comportamento da aplicação diante de dados inválidos, incompletos ou fora das regras esperadas.

### Testes de integração

Validação da transferência dos dados entre as diferentes etapas do processo de cotação.

### Testes End-to-End

Validação da jornada completa:

```text
Criar cotação
      ↓
Cadastrar veículo
      ↓
Cadastrar segurado
      ↓
Configurar produto
      ↓
Selecionar plano
      ↓
Visualizar cotação
      ↓
Enviar cotação
```

### Testes de regressão

Execução da suíte automatizada após alterações na aplicação, garantindo que funcionalidades existentes continuem funcionando.

---

## 🛠️ Tecnologias utilizadas

| Tecnologia         | Utilização                              |
| ------------------ | --------------------------------------- |
| Java               | Linguagem de programação                |
| Selenium WebDriver | Automação web                           |
| Cucumber           | BDD                                     |
| Gherkin            | Escrita dos cenários                    |
| JUnit              | Execução e validação dos testes         |
| Maven              | Gerenciamento do projeto e dependências |
| Git                | Controle de versão                      |
| GitHub             | Hospedagem do código                    |

---

## 📁 Estrutura do projeto

```text
vehicle-insurance-automation/
│
├── pom.xml
│
├── README.md
│
└── src
    └── test
        ├── java
        │   │
        │   ├── runners
        │   │   └── TestRunner.java
        │   │
        │   ├── steps
        │   │   ├── VehicleSteps.java
        │   │   ├── InsurantSteps.java
        │   │   ├── ProductSteps.java
        │   │   └── QuoteSteps.java
        │   │
        │   ├── pages
        │   │   ├── VehiclePage.java
        │   │   ├── InsurantPage.java
        │   │   ├── ProductPage.java
        │   │   ├── PriceOptionPage.java
        │   │   └── SendQuotePage.java
        │   │
        │   └── utils
        │       ├── DriverFactory.java
        │       └── TestData.java
        │
        └── resources
            │
            └── features
                └── vehicle_insurance.feature
```

---

## 🧩 Arquitetura

O projeto utiliza o padrão **Page Object Model (POM)**.

```text
              Feature
                 │
                 ▼
          Step Definitions
                 │
                 ▼
            Page Objects
                 │
                 ▼
        Selenium WebDriver
                 │
                 ▼
        Vehicle Insurance App
```

### Feature

Contém os cenários BDD escritos em Gherkin.

### Step Definitions

Responsáveis por conectar os passos Gherkin com a implementação Java.

### Page Objects

Centralizam os elementos e ações de cada página da aplicação.

### Driver Factory

Responsável pela criação e gerenciamento do WebDriver.

### Test Data

Centraliza os dados utilizados durante os testes.

---

# 📝 BDD

Os cenários são escritos utilizando **Gherkin**, permitindo que o comportamento esperado seja descrito de maneira clara e compreensível.

Exemplo:

```gherkin
Funcionalidade: Cotação de seguro automotivo

  Cenário: Realizar uma cotação completa de seguro
    Dado que acesso a aplicação de seguro
    E seleciono "Automobile"
    Quando preencho os dados válidos do veículo
    E avanço para os dados do segurado
    E preencho os dados válidos do segurado
    E avanço para os dados do produto
    E preencho os dados válidos do seguro
    E avanço para a seleção de preço
    E seleciono o plano "Platinum"
    Então devo visualizar o preço correspondente ao plano
    Quando visualizo a cotação
    Então os dados da cotação devem corresponder aos dados informados
```

---

# 🔎 Cenários de teste

A suíte contempla cenários como:

| ID     | Cenário                         | Tipo      | Prioridade |
| ------ | ------------------------------- | --------- | ---------- |
| CT-001 | Acessar aplicação               | Smoke     | Alta       |
| CT-002 | Selecionar Automobile           | Funcional | Alta       |
| CT-003 | Cadastrar veículo válido        | Funcional | Alta       |
| CT-004 | Campos obrigatórios do veículo  | Negativo  | Alta       |
| CT-005 | Dados inválidos do veículo      | Negativo  | Média      |
| CT-006 | Cadastrar segurado válido       | Funcional | Alta       |
| CT-007 | Campos obrigatórios do segurado | Negativo  | Alta       |
| CT-008 | Configurar produto              | Funcional | Alta       |
| CT-009 | Data de início inválida         | Negativo  | Alta       |
| CT-010 | Exibir planos disponíveis       | Funcional | Alta       |
| CT-011 | Selecionar Silver               | Funcional | Média      |
| CT-012 | Selecionar Gold                 | Funcional | Média      |
| CT-013 | Selecionar Platinum             | Funcional | Alta       |
| CT-014 | Selecionar Ultimate             | Funcional | Média      |
| CT-015 | Validar preço                   | Funcional | Crítica    |
| CT-016 | Visualizar cotação              | E2E       | Alta       |
| CT-017 | Download da cotação             | E2E       | Alta       |
| CT-018 | Enviar cotação                  | E2E       | Alta       |
| CT-019 | E-mail inválido                 | Negativo  | Média      |
| CT-020 | Senhas diferentes               | Negativo  | Média      |
| CT-021 | Navegação entre etapas          | Funcional | Média      |
| CT-022 | Fluxo completo                  | E2E       | Crítica    |

---

# 🚀 Como executar o projeto

## 1. Pré-requisitos

Antes de executar os testes, é necessário possuir:

* Java JDK 17 ou superior
* Maven
* Git
* IDE de sua preferência
* Google Chrome ou outro navegador suportado

Verifique as versões instaladas:

```bash
java -version
mvn -version
git --version
```

---

## 2. Clonar o projeto

```bash
git clone <URL_DO_REPOSITORIO>
```

Entrar no diretório:

```bash
cd vehicle-insurance-automation
```

---

## 3. Instalar as dependências

```bash
mvn clean install
```

---

## 4. Executar os testes

Para executar toda a suíte:

```bash
mvn test
```

Para executar um cenário específico utilizando uma tag:

```bash
mvn test -Dcucumber.filter.tags="@smoke"
```

Exemplo:

```gherkin
@smoke
Cenário: Realizar uma cotação completa de seguro
```

Executando:

```bash
mvn test -Dcucumber.filter.tags="@smoke"
```

---

# 🏷️ Tags utilizadas

As tags permitem organizar e executar grupos específicos de testes.

Exemplos:

```gherkin
@smoke
@regression
@functional
@negative
@e2e
```

Exemplo:

```gherkin
@e2e
@regression
Cenário: Realizar uma cotação completa de seguro
```

---

# 📊 Relatórios

Após a execução dos testes, os resultados podem ser disponibilizados através dos relatórios gerados pelo Cucumber.

Exemplo de estrutura:

```text
target/
│
├── cucumber-reports/
│
├── screenshots/
│
└── surefire-reports/
```

Os relatórios devem permitir identificar:

* Testes executados.
* Testes aprovados.
* Testes falhos.
* Cenários executados.
* Steps executados.
* Tempo de execução.
* Evidências de falha.

---

# 📸 Evidências

Em caso de falha, a automação pode capturar automaticamente um screenshot da página para facilitar a análise do problema.

Exemplo:

```text
Test Failed
     ↓
Screenshot
     ↓
Evidence
     ↓
Analysis
```

---

# 🔄 CI/CD

O projeto pode ser integrado a uma pipeline de CI/CD utilizando ferramentas como:

* Jenkins
* GitLab CI/CD
* GitHub Actions

Exemplo de fluxo:

```text
Git Push
   ↓
Pipeline
   ↓
Build
   ↓
Maven Test
   ↓
Selenium
   ↓
Cucumber Report
   ↓
Resultado
```

---

# 📌 Boas práticas aplicadas

O projeto busca seguir boas práticas de automação:

* Page Object Model.
* Separação de responsabilidades.
* Cenários independentes.
* Reutilização de métodos.
* Dados de teste centralizados.
* Uso de tags.
* Assertions claras.
* Evidências em caso de falha.
* Organização por funcionalidade.
* Execução via Maven.
* Preparação para CI/CD.

---

# 🎯 Melhorias futuras

Algumas evoluções planejadas:

* [ ] Implementar todos os cenários negativos.
* [ ] Implementar testes de boundary value.
* [ ] Implementar DataTables do Cucumber.
* [ ] Implementar Scenario Outline.
* [ ] Adicionar screenshots automáticos.
* [ ] Melhorar geração de relatórios.
* [ ] Implementar execução headless.
* [ ] Integrar com Jenkins/GitHub Actions.
* [ ] Executar testes em diferentes navegadores.
* [ ] Adicionar paralelismo.
* [ ] Implementar gerenciamento de massa de dados.
* [ ] Adicionar testes de API, caso uma API esteja disponível.
* [ ] Criar pipeline completa de CI/CD.

---

# 👨‍💻 Autor

**Antonio Santos**

QA / Software Testing

Foco em:

* Testes manuais
* Testes exploratórios
* Automação Web
* Automação de API
* Java
* Selenium WebDriver
* Cucumber / BDD
* JUnit
* RestAssured
* Postman
* Oracle
* Jenkins
* GitLab

---

## 📚 Referências

* [Tricentis — Vehicle Insurance Application](https://sampleapp.tricentis.com/101/app.php?utm_source=chatgpt.com)
* [Tricentis Documentation](https://docs.tricentis.com/?utm_source=chatgpt.com)

---

## ⭐ Sobre o projeto

Este projeto foi desenvolvido com finalidade de **estudo, prática e demonstração de conhecimentos em Quality Assurance e automação de testes**, utilizando uma abordagem baseada em BDD e boas práticas de engenharia de testes.

