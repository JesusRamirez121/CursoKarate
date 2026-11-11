Feature: Create new pet

  @ignore @crear
  Scenario: Crear un perro (reutilizable por otros escenarios)
    * def createANewPet = read('classpath:requests/createANewPet.json')
    Given url baseUrl
    And path 'pets'
    When request createANewPet
    And method post
    Then status 201
    And match response == {"status": "success", "message": "Pet created", "data": { id: #number, name: 'Bingo3', type: 'Perro', age: 1 }}
    * def petId = $.data.id

  @post
  Scenario: Create a new dog reading an external file and delete it
    * call read('pets.feature@crear')
    * call read('pets.feature@borrar')

  @get
  Scenario: Search a new dog
    * call read('pets.feature@crear')
    Given url baseUrl + "/pets/" + petId
    And method get
    Then status 200
    And match $.data.name == "Bingo3"
    * call read('pets.feature@borrar')

  @put
  Scenario: Update a pet
    * call read('pets.feature@crear')
    When url baseUrl + "/pets/" + petId
    And request { "name": "Bingo8", "type": "Gato", "age": 10}
    And method put
    Then status 200
    And match $.data.name == "Bingo8"
    * call read('pets.feature@borrar')

  @patch
  Scenario: Update partially a pet
    * call read('pets.feature@crear')
    When url baseUrl + "/pets/" + petId
    And request { "name": "Bluey"}
    And method patch
    Then status 200
    And match $.data.name == "Bluey"
    * call read('pets.feature@borrar')

  @delete
  Scenario: Delete a pet
    * call read('pets.feature@crear')
    And url baseUrl + "/pets/" + petId
    When method delete
    Then status 204

  @CrearMascota
  Scenario Outline: Create a new pet
    * def createANewPet = read('classpath:requests/createANewPetExamples.json')
    * def expected = read('classpath:responses/successfullPetCreationResponse.json')
    Given url baseUrl
    And path 'pets'
    And request createANewPet
    * print createANewPet
    When method post
    Then status 201
    And match response == expected
    * def petId = response.data.id
    * call read('pets.feature@borrar')
    * print name, type, age

    Examples:
      | name   | type  | age |
      | Bingo3 | Perro | 1   |
      | Bingo4 | Gato  | 2   |
      | Bingo5 | Loro  | 3   |

  @ignore @borrar
  Scenario: Borrar una mascota creada por la prueba
    Given url baseUrl + "/pets/" + petId
    When method delete
    Then status 204
