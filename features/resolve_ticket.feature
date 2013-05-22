Feature: Resolve Ticket
	As an authorized user
	I want to be able to resolve tickets
	@selenium
	Scenario:
		Given I am logged in
		And The number of open tickets is greater than 0
		When I click "Open tickets" in the tickets menu
		And I click on the top ticket
		And I change the "Ticket state" to "resolved"
		And I press "Update ticket"
		Then the state of the ticket should be "resolved"
		And the ticket should be in the list of closed tickets
