require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_driver = :selenium

Before do
end

After do
end

When(/^I click on my username$/) do
  page.find('#userbadge').find('strong').find('a').click
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_link arg1
end

When(/^I upload "(.*?)" in "(.*?)"$/) do |arg1, arg2|
  page.attach_file(arg2, File.expand_path("features/#{arg1}"))
end

Then(/^I should see "(.*?)"$/) do |arg1|
  assert page.has_content?(arg1)
end

Then(/^the location of the image should include "(.*?)"$/) do |arg1|
  assert page.first('.avatar-large')["src"].include? arg1
end

