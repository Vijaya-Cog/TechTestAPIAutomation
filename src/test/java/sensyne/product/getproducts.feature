
Feature: Test GET products API
 
Background: Preconditions
  Given url apiUrl

 
  Scenario: Get all products schema validation
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
 