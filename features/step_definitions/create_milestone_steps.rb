require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_driver = :selenium

Before do
  @milestone_name = ""
  @milestone_id = 0
end

After do
end

Then(/^the milestone should have a title "(.*?)"$/) do |milestone|
  @milestone_name = milestone
  @milestone_id = /milestones\/(\d+)-/.match(page.find_link("Edit milestone")["href"])[1]
  assert page.title.include?(milestone)
end

When(/^I change the "(.*?)" to the new milestone$/) do |field_name|
  # There may be multiple options with the same name, so we need to explicitly
  # select the right one
  match = "option[value=\"#{@milestone_id}\"]"
  page.find_field(field_name).find(match).select_option
end

Then(/^the ticket should have the new milestone$/) do
  link = page.first('.gcnt').find_link(@milestone_name)
  assert not(link.nil?) and link["href"].include?(@milestone_id)
end
