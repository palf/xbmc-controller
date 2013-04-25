Feature: Simple API calls

  ROLE
  FEATURE
  BENEFIT


  Scenario: When there is no XBMC instance to ping
    Given XBMC is not running
    And the client is configured at 'http://localhost:8080'
    When I call the ping method
    Then an error is raised


  Scenario: When there is a good response from ping
    Given XBMC is running at 'http://localhost:8080'
    And the client is configured at 'http://localhost:8080'
    When I call the ping method
    Then I get the response 'pong'


  Scenario: When I make an invalid request (non-existent method)
    Given XBMC is running at 'http://localhost:8080'
    And the client is configured at 'http://localhost:8080'
    When I call the 'Input.Banana' method
    Then I get the response 'pong'
