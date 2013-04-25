Feature: Simple API calls

  ROLE
  FEATURE
  BENEFIT


  Scenario: When there is no XBMC instance to ping
    Given the XBMC mock is not running
    And the client is configured at 'http://localhost:8080'
    When I call the ping method
    Then an error is raised


  Scenario: When there is a good response from ping
    Given the XBMC mock is running at 'http://localhost:8080'
    And the client is configured at 'http://localhost:8080'
    When I call the ping method
    Then the XBMC mock receives the method 'JSONRPC.Ping'


  Scenario: When I make an invalid request (non-existent method)
    Given the XBMC mock is running at 'http://localhost:8080'
    And the client is configured at 'http://localhost:8080'
    When I call the 'Input.Banana' method
    Then the XBMC mock receives the method 'Input.Banana'


  Scenario: When there is a good response from ping
    Given the XBMC mock is running at 'http://localhost:8080'
    And the XBMC mock is returning the correct response for 'ping'
    And the client is configured at 'http://localhost:8080'
    When I call the ping method
    Then I get the response 'pong'

