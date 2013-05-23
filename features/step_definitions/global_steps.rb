# This file sets up some often used step definitions and configuration for
# the Cucumber tests.

require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_driver = :selenium

Before do
  @url = 'http://re12.lighthouseapp.com/'
  @email = "hreynvaa@liacs.nl"
  @password = "testlogin"
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
  visit(@url)
  fill_in "email", :with => @email
  fill_in "password", :with => @password
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
