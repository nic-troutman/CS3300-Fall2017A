Feature: Compare Price

Scenario: Compare item prices from links
Given I am on the My Item List page with my new item
Then I should see each item’s price pulled from a few different websites
And I should see the lowest price highlighted if it is lower than my target price
