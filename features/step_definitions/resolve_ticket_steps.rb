require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_driver = :selenium

Before do
  @ticketid = 0
end

After do
end

def getnumberoftickets(page)
  elm = page.find('#search-sentence').first('b')
  if elm.nil?
    return 0
  else
    return /^\D*([\d,]+)$/.match(elm.text)[1].delete(',').to_i
  end
end

Given(/^The number of "(.*?)" is greater than (\d+)$/) do |query, min|
  click_menu(page, query)
  if getnumberoftickets(page) <= min.to_i then
    # Skip test, it should be possible to do it after the create ticket scenario
    print "Please run the 'create_ticket.feature' scenario, then try again.\n"
    pending
  end
end

When(/^I click on the top ticket$/) do
  page.find('#ticket-list-wrapper').first('.issue').first('a').click
end

When(/^I change the "(.*?)" to "(.*?)"$/) do |arg1, arg2|
  page.select(arg2, :from => arg1)
end

Then(/^the state of the ticket should be "(.*?)"$/) do |state|
  assert page.first('.tstate').text.include? (state)
end

Then(/^the ticket should be in the list of closed tickets$/) do
  @ticketid = page.first('.ticketnum').text.delete('#')
  click_menu(page, "Closed tickets")
  assert page.has_selector?("#ticket-#{@ticketid}")
end

