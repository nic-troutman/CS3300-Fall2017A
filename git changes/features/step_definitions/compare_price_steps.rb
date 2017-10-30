Given(/^I am on the My Item List page with my new item$/) do
  visit root_path
  expect(page).to have_content('My Items')
  click_on('Add item')
  expect(page).to have_content('Name' && 'Link' && 'Target price')
  fill_in 'Name', with: 'Cool Item'
  fill_in 'Link', with: 'www.test.com'
  fill_in 'Target price', with: '100'
  fill_in 'Current price', with: '90'
  click_button 'Add Item'
  # ensures we have a test item to work with
end
Then(/^I should see each item’s price pulled from a few different websites$/) do
  expect(page).to have_content('Cool Itemm' && '100' && '90')
  # after implementing actual pulls, we will have more than just this hardcoded value
  # we just want to make sure the data is there
end

Then(/^I should see the lowest price highlighted if it is lower than my target price$/) do
  expect(page).to have_css('div.container>div.row>div.sweetdeal>div.col-sm-6', :text => 'Cool Item')
  # checks that our item is within the "sweetdeal" wrapper div; only sweet deals are wrapped
end
