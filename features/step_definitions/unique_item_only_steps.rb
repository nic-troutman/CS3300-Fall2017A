# Given I am on the My Item List page with my new item		-creates the same test item as compare_price_steps.rb
# When I click “Add new item”			-clicks Add new item button in navbar
# Then I should be on Add New Item page		-ensures we are on new item page
When(/^I fill out the info that is exactly the same as another item's info$/) do
  fill_in 'Name', with: 'Cool Item'
  fill_in 'Link', with: 'www.test.com'
  fill_in 'Target price', with: '100'
  fill_in 'Current price', with: '90'
end
# And I press “Add item”			-clicks add item button
# Then I should be on My Item List page		-ensures we are on the index page
And(/^I should not see my new listing$/) do
  expect(page).not_to have_content('Cool Itemm' && '100' && '90')
end

# this test has a lot of overlapping logic with the add_item feature, so it shares many helper actions
