Given(/^I am on the My Item List page$/) do
        visit root_path
        expect(page).to have_content('My Items')
end

When(/^I click “Add new item”$/) do
        click_on('Add item')
end

Then(/^I should be on Add New Item page$/) do
        expect(page).to have_content('Name' && 'Link' && 'Target price')
end

When(/^I fill out the info$/) do
        fill_in 'Name', with: 'Cool Item'
        fill_in 'Link', with: 'www.test.com'
        fill_in 'Target price', with: '100'
	fill_in 'Current price', with: '90'
end

When(/^I press “Add item”$/) do
        click_button 'Add Item'
end

Then(/^I should be on My Item List page$/) do
        expect(page).to have_content('My Items')
end

Then(/^I should see my new listing$/) do
        expect(page).to have_content('Cool Item' && '100' && '90')
end
