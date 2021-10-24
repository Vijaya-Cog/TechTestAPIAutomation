@debug
Feature: Test PUT products API
 
Background: Preconditions
    Given url apiUrl
    

Scenario Outline: Update a product and validate if the update was successful using GET method
  Given path 'products'      
  When method GET
  Then status 200
 
  * def code = response[0].id
  * print 'the value of code is:', code
  

  Given path 'product/' + code       
  And request 
  """   
    {
        "name": "<productname>", 
        "price": <price>
    }

  """  
  When method PUT
  Then status 204
  Given path 'product/' + code 
  When method GET
  Then status 200
  Then match response.name == "<productname>"
  Then match response.price == "<price>"
  
Examples:
| productname           | price    | 
| Television            | 35.00    |



Scenario Outline: Update a product an invalid product and validate error code
    Given path 'product/18a'
    And request 
    """   
      {
          "name": "<productname>", 
          "price": <price>
      }
  
    """  
    When method PUT
    Then status 404
    Then match response.detail == "The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again."

 Examples:
| productname           | price    | 
| Computer              | 35.00    |