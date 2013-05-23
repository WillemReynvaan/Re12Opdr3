require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_driver = :selenium

Before do
  @ticketid = 0
end

After do
end

def click_menu(page, link_name)
  within('#t-menu') do
    first('em').click
    click_link link_name
  end
end

Given(/^I am logged in$/) do
  visit('http://re12.lighthouseapp.com/')
  fill_in "email", :with => "hreynvaa@liacs.nl"
  fill_in "password", :with => "testlogin"
  click_button "Sign In"
end

When(/^I press "(.*?)"$/) do |button_name|
  click_button button_name
end

When(/^I click "(.*?)"$/) do |link_name|
  click_link link_name
end

When(/^I click "(.*?)" in the tickets menu$/) do |link_name|
  click_menu(page, link_name)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field_name, value|
  fill_in field_name, :with => value
end

Then(/^the ticket should be shown with a title "(.*?)"$/) do |content|
  assert page.title.include?(content)
end

Then(/^the ticket should be in the list of open tickets$/) do
  @ticketid = page.first('.ticketnum').text.delete('#')
  click_menu(page, "Open tickets")
  assert page.has_selector?("#ticket-#{@ticketid}")
end
