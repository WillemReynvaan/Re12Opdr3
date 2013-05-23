Before do
  @ticketid = 0
end

After do
end

Then(/^the ticket should be shown with a title "(.*?)"$/) do |content|
  assert page.title.include?(content)
end

Then(/^the ticket should be in the list of open tickets$/) do
  @ticketid = page.first('.ticketnum').text.delete('#')
  click_menu(page, "Open tickets")
  assert page.has_selector?("#ticket-#{@ticketid}")
end
