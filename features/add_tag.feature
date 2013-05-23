Feature: Add tag to ticket
	As an authorised user
	I want to add a tag to a ticket
	So i can find it easier later
	@selenium
	Scenario:
		Given I am logged in
		And The number of "Open tickets" is greater than 0
		When I click "Open tickets" in the tickets menu
		And I click on the top ticket
		And I fill in "newtag" in the tag list
		And I press "Update ticket"
		Then i should see a tag named "newtag"
