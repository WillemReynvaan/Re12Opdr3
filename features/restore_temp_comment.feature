Feature: Restore temporarily saved comment
	As an authorized user
	I want to be able to restore a comment I was typing
	Because my browser might crash while I was typing
	And I don't want to type it all over again
	@selenium
	Scenario:
		Given I am logged in
		When I click "Create new ticket"
		And I fill in "ticket-body" with "Foo bar baz"
		And I reload the page
		Then the "ticket-body" should contain "Foo bar baz"
