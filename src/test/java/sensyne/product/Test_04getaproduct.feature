
Feature: Test GET products API
 
  Background: Preconditions
    Given url apiUrl

  

  Scenario: Get a product and perform schema validation
    Given path 'products'      
    When method GET
    Then status 200
   
    * def code = response[0].id
    * print 'the value of code is:', code
    

    Given path 'product/' + code     
    When method GET
    Then status 200                              
                 
    And match response ==
    """   
      {
          "name": "#string", 
          "id": '#number',
          "price": "#string"               
      }
    """

    Scenario: Get a product which does not exist
      Given path 'product/500'         
      When method GET
      Then status 404                                    
      And match response.detail == "The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again."


    Scenario: Get a product which does not exist
      Given path 'product/5a'         
      When method GET
      Then status 404                                    
      And match response.detail == "The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again."