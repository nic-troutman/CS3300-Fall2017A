Feature: Edit and Delete item

Scenario: User wants to edit or delete an item
Given I am on the Home Page
When I click on an item
Then I should be on the Edit Item page
When I edit an item's information
And I click Update Item
Then I should be back at the Home Page
And I should see my edited item
When I click on the Edit Item page
And I click on the Delete button
Then I should be back on the Home Page
And I should not see the item I deleted
