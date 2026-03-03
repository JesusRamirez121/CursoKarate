Feature: Create new pet

  @post
  Scenario: Create a new dog reading an external file
    * def createANewPet = read('classpath:requests/createANewPet.json')
    Given url baseUrl
    And path 'pets'
    When request createANewPet
    And method post
    Then status 201
    And match response == {"status": "success", "message": "Pet created", "data": { id: #number, name: 'Bingo3', type: 'Perro', age: 1 }}
    * def petId = $.data.id

  @get
  Scenario: Search a new dog
    * call read('pets.feature@post')
    Given url "http://localhost:3001/pets/" + petId
    And method get
    Then status 200
    And match $.data.name == "Bingo3"

  @put
  Scenario: Update a pet
    * call read('pets.feature@post')
    When url "http://localhost:3001/pets/" + petId
    And request { "name": "Bingo8", "type": "Gato", "age": 10}
    And method put
    Then status 200
    And match $.data.name == "Bingo8"

  @patch
  Scenario: Update partially a pet
    * call read('pets.feature@post')
    When url "http://localhost:3001/pets/" + petId
    And request { "name": "Bluey"}
    And method patch
    Then status 200
    And match $.data.name == "Bluey"

  @delete
  Scenario: Update partially a pet
    * call read('pets.feature@post')
    And url "http://localhost:3001/pets/" + petId
    When method delete
    Then status 204

  @CrearMascota
  Scenario Outline: Create a new pet
    * def createANewPet = read('classpath:requests/createANewPetExamples.json')
    * def response = read('classpath:responses/successfullPetCreationResponse.json')
    Given url baseUrl
    And path 'pets'
    And request createANewPet
    * print createANewPet
    When method post
    Then status 201
    And match response == response
    * print name, type, age

    Examples:
      | name   | type  | age |
      | Bingo3 | Perro | 1   |
      | Bingo4 | Gato  | 2   |
      | Bingo5 | Loro  | 3   |