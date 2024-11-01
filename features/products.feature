Feature: The product store service back-end
    As a Product Store Owner
    I need a RESTful catalog service
    So that I can keep track of all my products

Background:
    Given the following products
        |trebuchet |  A trebuchet to throw big rocks       | price   | available | categor
        |siege tower | For the tallest walls. Assembly required.    | 999.99   |  False      | SIEGE_ENGINES
        |ballista     | Goes through walls like a hot knife through butter!      | 999.99 
        |sword   | Finest Damascus steel   | 99.99    | True      | SIDEARM       |
        |mace | Simple yet effective | 9.99   | True      | SIDEARM |
        | plate armor |Our finest | 99.99 | True | BODY_PROTECTION  |
        | chain mail | For the fighter on the go |59.99 | True | BODY_PROTECTION    |
        | pitch | Just boil and pour | 2.99 | True | FLAMMABLES  |
        | Greek fire | Only with written permission from the Basileus | 19.99 |  FLAMMABLE
        | brimstone | Buy with our pitch |  5.99 | True | FLAMMABLES |
        | royal banner | Reprazent for your Basileus | 10.99 | True | SWAG     |
        | riding boots| Like the ones the steppe archers use | 2.99 | False |  SWAG  |

Scenario: The server is running
    When I visit the "Home Page"
    Then I should see "Product Catalog Administration" in the title
    And I should not see "404 Not Found"

Scenario: Create a Product
    When I visit the "Home Page"
    And I set the "Name" to "sword"
    And I set the "Description" to "Damascus steel"
    And I select "True" in the "Available" dropdown
    And I select "Sidearms" in the "Category" dropdown
    And I set the "Price" to "99.99"
    And I press the "Create" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    Then the "Id" field should be empty
    And the "Name" field should be empty
    And the "Description" field should be empty
    When I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "sword" in the "Name" field
    And I should see "Finest Damascus steel" in the "Description" field
    And I should see "True" in the "Available" dropdown
    And I should see "Sidearms" in the "Category" dropdown
    And I should see "99.99" in the "Price" field
