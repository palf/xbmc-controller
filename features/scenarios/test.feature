Feature: A Simple Test
  
  I'd like to have a simple test of the server and basic returns
  SO I can begin building a suite of server-testing steps

  Background: 
    Given the server root is 'http://localhost:3001'
    And I start the server

  Scenario: Initial test
    When I navigate to '/test'
    Then the response is 'fish'

