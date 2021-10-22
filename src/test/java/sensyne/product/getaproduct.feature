Feature: Test GET products API
 
  Background:
    * url 'http://localhost:5000/v1/'

  
@debug
  Scenario: Get a product
    Given path 'product/8'
    When method GET
    Then status 200
    Then match response.id == 8
    
    
