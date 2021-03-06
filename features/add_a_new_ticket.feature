Feature: Add a New Ticket
	As an authorized user
	I want to be able to add tickets to projects
	So that the issue is tracked
	@selenium
	Scenario:
		Given I am logged in
		When I click "Create new ticket"
		And I fill in "ticket_title" with "Test"
		And I fill in "ticket-body" with "This is a test"
		And I press "Create ticket"
		Then the ticket should be shown with a title "Test"
		And the ticket should be in the list of open tickets
