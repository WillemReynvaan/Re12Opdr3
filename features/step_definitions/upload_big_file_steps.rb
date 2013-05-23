Then(/^i should see a link named "(.*?)"$/) do |arg1|
  assert page.has_link?(arg1)
end
