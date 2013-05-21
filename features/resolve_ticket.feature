Feature: Resolve Ticket
	As an authorized user
	I want to be able to resolve tickets
	@selenium
	Scenario:
		Given I am logged in
		And The number of resolved tickets is X
		When I click "Open tickets"
		And I click on the top ticket
		And I change the "Ticket state" to "resolved"
		And I press "Update ticket"
		Then the number of resolved tickets should be X+1
