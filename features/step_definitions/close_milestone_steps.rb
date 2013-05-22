require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_driver = :selenium

Before do
end

After do
end

Given(/^there is a milestone with open tickets$/) do
  click_link "Milestones"
  list = page.find('.milestone-list')
  if list.nil? or list.all('.num').none? { |elm| elm.text.delete(',').to_i > 0 } then
    # Skip test, it should be possible to do it after the create ticket and 
    # create milestone scenario
    print "Please run the 'create_ticket.feature' and 'create_milestone.feature scenario, \nthen try again.\n"
    pending
  end
end

When(/^I click on a milestone with open tickets$/) do
  items = page.find('.milestone-list').all('.milestone-item')
  open = items.find { |elm| elm.first('.num').text.delete(',').to_i > 0 }
  open.first('a.ttl').click
end
