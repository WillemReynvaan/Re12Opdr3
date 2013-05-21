require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_driver = :selenium

Before do
  @tickets = 0
end

After do
end

def getresolvedticketslink(page)
  return page.find('#shared-ticket-bins').find('a[title="Query: state:resolved"]')
end

def getresolvedtickets(page)
  return getresolvedticketslink(page).find('.badge').text.delete(',').to_i
end


Given(/^The number of resolved tickets is X$/) do
  @tickets = getresolvedtickets(page)
  print "Resolved tickets: #{@tickets}\n"
end

When(/^I click on the top ticket$/) do
  page.first('#open-tickets').first('.issue').find('a').click
end

When(/^I change the "(.*?)" to "(.*?)"$/) do |arg1, arg2|
  page.select(arg2, :from => arg1)
end

Then(/^the number of resolved tickets should be X\+1$/) do
  print "Waiting for Lighthouse to update ticket counts...\n"
  sleep(10)
  getresolvedticketslink(page).click
  t = getresolvedtickets(page)
  print "Current: #{t} expected: #{@tickets+1}\n"
  assert t == @tickets+1
end

