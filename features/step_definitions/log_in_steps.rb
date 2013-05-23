Given(/^I am at the login page$/) do
  visit("#{@url}login")
end

When(/^I fill in my e-mail address$/) do
  fill_in "email", :with => @email
end

When(/^I fill in my password$/) do
  fill_in "password", :with => @password
end

When(/^I press on "(.*?)"$/) do |arg1|
  click_button "Sign In"
end

