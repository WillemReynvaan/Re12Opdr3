require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_driver = :selenium

Before do
  @tickets = 0
end

After do
end

def getopenticketslink(page)
  return page.find('#shared-ticket-bins').find('a[title="Query: state:open"]')
end

def getopentickets(page)
  return getopenticketslink(page).find('.badge').text.delete(',').to_i
end

Given(/^I am logged in$/) do
  visit('http://re12.lighthouseapp.com/')
  fill_in "email", :with => "hreynvaa@liacs.nl"
  fill_in "password", :with => "testlogin"
  click_button "Sign In"
end

Given(/^I am on the tickets page for the (.*?) project$/) do |project|
  visit("http://re12.lighthouseapp.com/projects/#{project}/tickets?q=all")
end

Given(/^The number of open tickets is X$/) do
  @tickets = getopentickets(page)
  print "Open tickets: #{@tickets}"
end

When(/^I press "(.*?)"$/) do |button_name|
  click_button button_name
end

When(/^I click "(.*?)"$/) do |link_name|
  click_link link_name
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field_name, value|
  fill_in field_name, :with => value
end

Then(/^the ticket should be shown with a title "(.*?)"$/) do |content|
  assert page.has_content?(content)
end

Then(/^the number of open tickets should be X\+1$/) do
  sleep(5)
  getopenticketslink(page).click
  t = getopentickets(page)
  print "Current: #{t} expected: #{@tickets+1}"
  assert t == @tickets+1
end
