Given(/^I am at the login page$/) do
  visit('http://re12.lighthouseapp.com/login')
end

When(/^I fill in "(.*?)"$/) do |arg1|
  fill_in "email", :with => "hreynvaa@liacs.nl"
end

When(/^I fill in my "(.*?)"$/) do |arg1|
  fill_in "password", :with => "testlogin"
end

When(/^I press on "(.*?)"$/) do |arg1|
  click_button "Sign In"
end

