Feature: PetStore API automation suite

  Background:
    # Definir la URL base para todas las peticiones en este feature
    * url 'https://petstore.swagger.io/v2'

  Scenario: Automatizar el flujo completo de una mascota
    
    # 1. Añadir una mascota a la tienda
    Given path '/pet'
    And request 
      """
      {
        "category": {
          "id": 0,
          "name": "dogs"
        },
        "name": "doggie",
        "photoUrls": [
          "string"
        ],
        "tags": [
          {
            "id": 0,
            "name": "friendly"
          }
        ],
        "status": "available"
      }
      """
    When method POST
    Then status 200
    And match response.name == 'doggie'
    
    # Almacenar el ID de la mascota en una variable para usarlo en peticiones futuras
    * def petId = response.id

    # 2. Consultar la mascota ingresada por ID
    Given path '/pet/', petId
    When method GET
    Then status 200
    * retry until response.id == petId
    And match response.name == 'doggie'
    * def myPet = response

    # 3. Actualizar el nombre y el estatus de la mascota a "sold"
    * set myPet.name = 'Buddy'
    * set myPet.status = 'sold'
    Given path '/pet'
    And request myPet
    When method PUT
    Then status 200
    And match response.status == 'sold'
    And match response.name == 'Buddy'
    
    # 4. Consultar la mascota por su nuevo estatus ("sold")
    Given path '/pet/findByStatus'
    And param status = 'sold'
    When method GET
    Then status 200
    # Encuentra la mascota por su ID en la lista de respuesta y la guarda en una variable
    * def myPetFound = karate.jsonPath(response, "$.[?(@.id == '"+ petId +"')]")[0]
    # Ahora que ya tienes el objeto exacto, puedes hacer el `match` preciso
    And match myPetFound.id == petId
    And match myPetFound.status == 'sold'
    And match myPetFound.name == 'Buddy'