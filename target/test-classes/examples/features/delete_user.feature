@Desarrollo
Feature: Eliminar usuario

  Background:
    * url baseUrl
    * header x-api-key = xApiKey
    * def userId = 2

  Scenario: Codigo de la respuesta 204
    Given path 'users', userId
    When method DELETE
    Then status 204

  Scenario: Contenido de la respuesta vacia
    Given path 'users', userId
    When method DELETE
    Then match response == ''

  Scenario: Tiempo limite de la respuesta
    Given path 'users', userId
    When method DELETE
    * assert responseTime < 3000