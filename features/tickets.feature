Feature: Create Ticket
	As an authorized user
	I want to be able to add tickets to projects
	So that the issue is tracked
	Scenario:
		Given I am logged in
		And I am on the tickets page for the 108787-assignment-3 project
		And The number of tickets is X
		When I press "Create new ticket"
		And I fill in "ticket_title" with "Test"
		And I fill in "ticket-body" with "This is a test"
		And I press "Create ticket"
		Then the ticket should be shown with a title "Test"
		And the number of tickets should be X+1
