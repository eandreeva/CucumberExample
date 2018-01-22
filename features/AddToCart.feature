Feature: Add To Cart

  Scenario: Users can find an item and add it to cart

    Given I'm on Home page
    When I search for "Canon EOS 1300D"
    Then I should see the search results block
    When I click first result link
    Then I should see the product "Canon EOS 1300D Body" page
    And product name is "Canon EOS 1300D Body"
    And sensor size is "APS-C (1.6 crop)"
    And sensor pixel recording is "18 Мп"
    And display size is "3 ''"
    When I add item to cart
    Then there is 1 item in cart
    When I go to cart
    Then I should see the cart page
    And there is 1 item on cart page
    And product 1 has "Canon EOS 1300D Body" name