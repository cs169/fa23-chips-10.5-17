# features/step_definitions/search_steps.rb

When("I fill in {string} with {string}") do |field, value|
  fill_in(field, with: value)
end

When("I select {string} from {string}") do |option, dropdown|
  select(option, from: dropdown)
end

When("I press {string}") do |button|
  click_button(button)
end

Then("I should see {string} in the search results") do |representative_name|
  expect(page).to have_content(representative_name)
end

Then("I should not see other representatives") do
  expect(page).to have_css('.representative', count: 1)
end

# Add more steps as needed for other scenarios
