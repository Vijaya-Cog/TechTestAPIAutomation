Feature: Test GET products API
 
  Background:
    * url 'http://localhost:5000/v1/'

  
  Scenario: Get all products
    Given path 'products'
    When method GET
    Then status 200
 