Feature: Test POST products API
 
Background:
  * url 'http://localhost:5000/v1/'


Scenario: Post a product
  Given path 'product'
  And request {"name": "sofa","price": 50.25}    
  When method POST
  Then status 204
  

Scenario: Post a product by providing the optional product code
    Given path 'product'
    And request {"name": "bean bag", "product_code": 11,"price": 60.25}    
    When method POST
    Then status 204    // this should be error 404 as we are passing an existing code