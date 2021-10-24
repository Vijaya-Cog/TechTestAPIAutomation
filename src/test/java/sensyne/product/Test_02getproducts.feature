
Feature: Test GET products API
 
Background: Preconditions
  Given url apiUrl

 
  Scenario: Get all products and perform schema validation
    Given path 'products'
    When method GET
    Then status 200
    And match each response ==
    """   
      {
          "name": "#string", 
          "id": '#number',
          "price": "#string"    
      }
    """
 