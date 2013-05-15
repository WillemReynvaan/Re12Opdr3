#require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_driver = :selenium

Before do
  @tickets = 0
end

After do
end

Given(/^I am logged in$/) do
  visit('http://re12.lighthouseapp.com/')
end

Given(/^I am on the tickets page for the (.*?) project$/) do |project|
  visit("http://re12.lighthouseapp.com/projects/#{project}/tickets?q=all")
end

Given(/^The number of tickets is X$/) do
  @tickets = /all (\d+)/.match(find('#search-sentence').find('b').value)[1]
end

When(/^I press "(.*?)"$/) do |button_name|
  click_button button_name
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field_name, value|
  fill_in field_name, :with => value
end

Then(/^the ticket should be shown with a title "(.*?)"$/) do |content|
  assert page.has_content?(content)
end

Then(/^the number of tickets should be X\+1$/) do
  pending # express the regexp above with the code you wish you had
end
