
Feature: Test POST products API
 
Background: Preconditions
    Given url apiUrl
    
 
Scenario Outline: Post a product
  Given path 'product'
  And request 
  """   
    {
        "name": "<productname>", 
        "price": <price>
    }

  """  
  When method POST
  Then status 204
  
Examples:
| productname       | price    | 
| chair             | 35       |
| laptop            | 25       |
| cpu               | 15       |
| wireless mouse    | 12.00    |
| fan               | 45.00    |



Scenario: Error message validation when price is not provided
    Given path 'product'
    And request 
    """   
      {
          "name": "papers"
          
      }
  
    """  
    When method POST
    Then status 400                   
    And match response.detail == "'price' is a required property"

   
Scenario: Error message validation when name is not provided
    Given path 'product'
    And request 
    """   
      {
          "price": 23
          
      }
  
    """  
    When method POST
    Then status 400                   
    And match response.detail == "'name' is a required property"
   
    
Scenario: Error message validation when price is not a number
    Given path 'product'
    And request 
    """   
      {
          
          "name": "papers",
          "price": 23p
          
      }
  
    """  
    When method POST
    Then status 400                   
    And match response.detail == "'23p' is not of type 'number' - 'price'"




Scenario: Post a product by providing the optional product code
    Given path 'product'
    And request 
    """   
        {
            "name": "Laptop", 
            "product_code": 11,
            "price": 60.25
        }
    """
    When method POST
    Then status 204    //  Defect ID_002 optional product code when provided is not validated when we are passing an existing code this should be error 404