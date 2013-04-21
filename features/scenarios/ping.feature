Feature: Ping

  ROLE
  FEATURE
  BENEFIT


  Scenario: When there is no XBMC instance to ping
    Given XBMC is not running
    And the client is configured at 'http://localhost:8080'
    When I call the ping method
    Then an error is raised


Scenario: When there is no XBMC instance to ping
    Given XBMC is running at 'http://localhost:8080'
    And the client is configured at 'http://localhost:8080'
    When I call the ping method
    Then I get the response 'pong'
