@Desarrollo @Produccion
Feature: Modificar atributos de usuario

  Background:
    * url baseUrl
    * header x-api-key = xApiKey
    * def userId = 2

  Scenario: Estado de respuesta Ok
    Given path 'users', userId
    And request
      """
      {
        "name": "morpheus",
        "job": "zion resident"
      }
      """
    When method PATCH
    Then status 200


  Scenario: Estructura de la respuesta correcta
    Given path 'users', userId
    And request
      """
      {
        "name": "morpheus",
        "job": "zion resident"
      }
      """
    When method PATCH
    Then match response contains
      """
      {
        "name": "#present",
        "job": "#present",
        "updatedAt": "#present"
      }
      """

  Scenario: Contenido de la respuesta correcta
    Given path 'users', userId
    And request
      """
      {
        "name": "morpheus",
        "job": "zion resident"
      }
      """
    When method PATCH
    Then match response.name == "morpheus"
    And match response.job == "zion resident"
