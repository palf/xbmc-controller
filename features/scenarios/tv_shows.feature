Feature: TV Shows
  
  I want some example content to see what the XBMC default scraper makes of my file naming

  Background: 
    Given the server root is 'http://localhost:3001'
    And I start the server

  Scenario: TV Shows
    When I navigate to '/'
    Then the response is 'fish'

