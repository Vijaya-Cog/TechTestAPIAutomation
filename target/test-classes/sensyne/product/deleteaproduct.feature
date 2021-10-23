
Feature: Test DELETE products API
 
  Background: Preconditions
    Given url apiUrl

    Scenario: Delete a product 
    Given path 'product/35'         
    When method DELETE
    Then status 204

 
  
  Scenario: Validating the error message of a already Deleted product 
    Given path 'product/35'         
    When method DELETE
    Then status 404
    And match response.title == "Not Found"
  
  Scenario: Validating the error message of an invalid product
    Given path 'product/40a'         
    When method DELETE
    Then status 404
    And match response.title == "Not Found"