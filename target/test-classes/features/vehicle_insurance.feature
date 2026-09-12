# language: pt

@testSuit
Funcionalidade: Cotação de seguro automotivo
  Como uma pessoa interessada em contratar um seguro automotivo
  Quero realizar uma cotação informando os dados necessários
  Para visualizar e enviar uma proposta de seguro

  # ============================================================
  # VEHICLE DATA
  # ============================================================

  @smoke @vehicle
  Cenário: Cadastrar veículo com dados válidos
    Dado que acesso a aplicação de seguro automotivo
    E seleciono a opção "Automobile"
    Quando preencho os dados do veículo:
      | campo                | valor      |
      | Make                 | Audi       |
      | Model                | Scooter    |
      | Cylinder Capacity    | 1000       |
      | Engine Performance   | 100        |
      | Date of Manufacture  | 01/01/2020 |
      | Number of Seats      | 4          |
      | Fuel Type            | Petrol     |
      | List Price           | 50000      |
      | License Plate Number | ABC1234    |
      | Annual Mileage       | 10000      |
    E clico no botão "Next"
    Então devo ser direcionado para a etapa "Enter Insurant Data"


  @negative @vehicle
  Cenário: Tentar avançar sem preencher os dados obrigatórios do veículo
    Dado que acesso a aplicação de seguro automotivo
    E seleciono a opção "Automobile"
    Quando não preencho os dados obrigatórios do veículo
    E clico no botão "Next"
    Então devo visualizar mensagens de validação
    E não devo avançar para a próxima etapa


  @negative @vehicle
  Cenário: Informar capacidade do cilindro inválida
    Dado que acesso a aplicação de seguro automotivo
    E seleciono a opção "Automobile"
    Quando preencho os dados do veículo com uma capacidade de cilindro inválida
    E preencho os demais campos obrigatórios corretamente
    E clico no botão "Next"
    Então devo visualizar uma mensagem de validação
    E não devo avançar para a próxima etapa


  # ============================================================
  # INSURANT DATA
  # ============================================================

  @functional @insurant
  Cenário: Cadastrar segurado com dados válidos
    Dado que estou na etapa "Enter Insurant Data"
    Quando preencho os dados do segurado:
      | campo          | valor               |
      | First Name     | Antonio             |
      | Last Name      | Santos              |
      | Date of Birth  | 01/01/1990          |
      | Gender         | Male                |
      | Street Address | Rua Teste, 100      |
      | Country        | Brazil              |
      | Zip Code       | 07000000            |
      | City           | Guarulhos           |
      | Occupation     | Employee            |
      | Website        | https://example.com |
    E clico no botão "Next"
    Então devo ser direcionado para a etapa "Enter Product Data"


  @negative @insurant
  Cenário: Tentar avançar sem preencher os dados obrigatórios do segurado
    Dado que estou na etapa "Enter Insurant Data"
    Quando deixo os campos obrigatórios vazios
    E clico no botão "Next"
    Então devo visualizar mensagens de validação
    E não devo avançar para a próxima etapa


  @negative @insurant
  Cenário: Informar data de nascimento inválida
    Dado que estou na etapa "Enter Insurant Data"
    Quando informo uma data de nascimento inválida
    E preencho os demais campos obrigatórios corretamente
    E clico no botão "Next"
    Então devo visualizar uma mensagem de validação
    E não devo avançar para a próxima etapa


  # ============================================================
  # PRODUCT DATA
  # ============================================================

  @functional @product
  Cenário: Configurar produto com dados válidos
    Dado que estou na etapa "Enter Product Data"
    Quando informo a data de início do seguro
    E seleciono o valor da cobertura
    E seleciono o Merit Rating
    E seleciono o Damage Insurance
    E seleciono a opção "Euro Protection"
    E seleciono a opção "Legal Defense Insurance"
    E seleciono a opção "Courtesy Car"
    E clico no botão "Next"
    Então devo ser direcionado para a etapa "Select Price Option"


  @negative @product
  Cenário: Informar data de início do seguro inválida
    Dado que estou na etapa "Enter Product Data"
    Quando informo uma data de início inválida
    E preencho os demais dados corretamente
    E clico no botão "Next"
    Então devo visualizar uma mensagem de validação
    E não devo avançar para a seleção de preço


  # ============================================================
  # PRICE OPTION
  # ============================================================

  @functional @price
  Cenário: Visualizar opções de seguro
    Dado que preenchi corretamente os dados do veículo
    E preenchi corretamente os dados do segurado
    E preenchi corretamente os dados do produto
    Quando avanço para a seleção de preço
    Então devo visualizar o plano "Silver"
    E devo visualizar o plano "Gold"
    E devo visualizar o plano "Platinum"
    E devo visualizar o plano "Ultimate"


  @functional @price
  Cenário: Selecionar plano Silver
    Dado que estou na etapa de seleção de preço
    Quando seleciono o plano "Silver"
    Então o plano "Silver" deve ficar selecionado


  @functional @price
  Cenário: Selecionar plano Gold
    Dado que estou na etapa de seleção de preço
    Quando seleciono o plano "Gold"
    Então o plano "Gold" deve ficar selecionado


  @functional @price
  Cenário: Selecionar plano Platinum
    Dado que estou na etapa de seleção de preço
    Quando seleciono o plano "Platinum"
    Então o plano "Platinum" deve ficar selecionado


  @functional @price
  Cenário: Selecionar plano Ultimate
    Dado que estou na etapa de seleção de preço
    Quando seleciono o plano "Ultimate"
    Então o plano "Ultimate" deve ficar selecionado


  @regression @price
  Cenário: Validar preço do plano Platinum
    Dado que estou na etapa de seleção de preço
    Quando seleciono o plano "Platinum"
    Então devo visualizar o preço correspondente ao plano Platinum
    E o preço apresentado deve estar de acordo com os dados informados


  # ============================================================
  # QUOTE
  # ============================================================

  @e2e @quote
  Cenário: Visualizar cotação
    Dado que preenchi todas as etapas da cotação corretamente
    E selecionei o plano "Platinum"
    Quando clico em "View Quote"
    Então devo visualizar os detalhes da cotação
    E os dados do veículo devem estar corretos
    E os dados do segurado devem estar corretos
    E os dados do produto devem estar corretos
    E o plano selecionado deve ser "Platinum"


  @e2e @quote
  Cenário: Fazer download da cotação
    Dado que preenchi todas as etapas da cotação corretamente
    E selecionei um plano de seguro
    Quando clico em "Download Quote"
    Então o sistema deve gerar a cotação
    E o arquivo da cotação deve ser disponibilizado para download


  # ============================================================
  # SEND QUOTE
  # ============================================================

  @e2e @sendquote
  Cenário: Enviar cotação com dados válidos
    Dado que preenchi todas as etapas da cotação corretamente
    E selecionei o plano "Platinum"
    E estou na tela de envio da cotação
    Quando informo um e-mail válido
    E informo um telefone válido
    E informo um username válido
    E informo uma senha válida
    E confirmo a senha
    E informo um comentário
    E clico no botão "Send"
    Então a cotação deve ser enviada
    E devo visualizar uma mensagem de confirmação


  @negative @sendquote
  Cenário: Enviar cotação com e-mail inválido
    Dado que estou na tela de envio da cotação
    Quando informo um e-mail inválido
    E preencho os demais campos corretamente
    E clico no botão "Send"
    Então devo visualizar uma mensagem de validação
    E a cotação não deve ser enviada


  @negative @sendquote
  Cenário: Enviar cotação com senhas diferentes
    Dado que estou na tela de envio da cotação
    Quando informo uma senha válida
    E informo uma confirmação de senha diferente
    E preencho os demais campos corretamente
    E clico no botão "Send"
    Então devo visualizar uma mensagem de validação
    E a cotação não deve ser enviada


  # ============================================================
  # NAVEGAÇÃO
  # ============================================================

  @functional @navigation
  Cenário: Voltar para etapa anterior
    Dado que estou na etapa "Enter Insurant Data"
    Quando clico no botão "Previous"
    Então devo retornar para a etapa "Enter Vehicle Data"
    E os dados anteriormente preenchidos devem permanecer disponíveis


  # ============================================================
  # END TO END
  # ============================================================

  @e2e @regression
  Cenário: Realizar uma cotação completa de seguro automotivo
    Dado que acesso a aplicação de seguro automotivo
    E seleciono a opção "Automobile"
    Quando preencho os dados válidos do veículo
    E clico no botão "Next"
    E preencho os dados válidos do segurado
    E clico no botão "Next"
    E preencho os dados válidos do produto
    E clico no botão "Next"
    E seleciono o plano "Platinum"
    Então devo visualizar o preço correspondente ao plano Platinum
    Quando clico em "View Quote"
    Então devo visualizar os detalhes da cotação
    E os dados apresentados devem corresponder aos dados informados