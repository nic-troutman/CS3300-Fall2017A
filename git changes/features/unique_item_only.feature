Feature: Unique Entries Only

Scenario: User cannot add an existing item
Given I am on the My Item List page with my new item
When I click “Add new item”
Then I should be on Add New Item page
When I fill out the info that is exactly the same as another item's info
And I press “Add item”
Then I should be on My Item List page
And I should not see my new listing
