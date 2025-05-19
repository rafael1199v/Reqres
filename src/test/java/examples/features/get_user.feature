@Produccion @Desarrollo
Feature: Conseguir usuario

  Background:
    * url baseUrl
    * header x-api-key = xApiKey
    * def userId = 2

  Scenario: Conseguir lista de usuarios
    Given path 'users'
    And param page = 2
    When method GET
    Then status 200
    And match response.page == 2
    And match response.per_page == 6
    And match response.total == 12

  Scenario: Conseguir estructura de la lista de usuarios
    Given path 'users'
    And param page = 2
    When method GET
    Then status 200
    And match response contains
    """
    {
      per_page: "#present",
      total: "#present",
      total_pages: "#present",
      data: "#present"
    }
    """
    And match response.data contains
    """
    {
      id: "#present",
      email: "#present",
      first_name: "#present",
      last_name: "#present",
      avatar: "#present"
    }
    """

  Scenario: Conseguir un usuario
    Given path 'users', userId
    When method GET
    Then status 200
    And match response contains
    """
    {
      data: "#present",
      support: "#present"
    }
    """
    And match response.data contains
    """
    {
      id: "#present",
      email: "#present",
      first_name: "#present",
      last_name: "#present",
      avatar: "#present"
    }
    """
    And match response.data.id == 2
    And match response.data.email == "janet.weaver@reqres.in"
    And match response.data.first_name == 'Janet'
    And match response.data.last_name == 'Weaver'

