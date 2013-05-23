Feature: Add tag to ticket
	As an authorised user
	I want to add a tag to a ticket
	So it will be easier to find later
	@selenium
	Scenario:
		Given I am logged in
		And The number of "All tickets" is greater than 0
		When I click "All tickets" in the tickets menu
		And I click on the top ticket
		And I fill in "newtag" in the tag list
		And I press "Update ticket"
		Then I should see a tag named "newtag"
