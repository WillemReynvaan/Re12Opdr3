When(/^I fill in "(.*?)" in the tag list$/) do |arg1|
  page.first("#taggings").first("input").set(arg1)
end

Then(/^i should see a tag named "(.*?)"$/) do |arg1|
  assert page.first(".taglist").has_link?(arg1)
end

