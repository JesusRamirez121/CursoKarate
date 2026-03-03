Feature: Authentication

  Background:
    * url baseUrl

  @BasicAuth
  Scenario: Basic authentication
    * def credencials = "admin:password123"
    * def encoded = Java.type('java.util.Base64').encoder.encodeToString(credencials.getBytes())
    * print encoded
    Given path "protected-basic"
    And header Authorization = 'Basic ' + encoded
    When method get
    Then status 200

  @BearerToken
  Scenario: Bearer authentication
    Given path "login"
    And request { "username": "automation" }
    When method post
    Then status 200
    And def accessToken = $.data.accessToken
    And path "protected-bearer"
    And header Authorization = "Bearer "  + accessToken
    When method get
    Then status 200