require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_driver = :selenium

Before do
end

After do
end

When(/^I reload the page$/) do
  # Explicitly wait for the page to save the comment
  sleep(Capybara.default_wait_time)
  visit(current_url)
end

Then(/^the "(.*?)" should contain "(.*?)"$/) do |field_name, content|
  # Explicitly wait for the page to restore the comment
  sleep(Capybara.default_wait_time)
  assert page.find_field(field_name).value.include?(content)
end
