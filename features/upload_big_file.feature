Feature: Add profile picture
	As an authorised user
	I want to change my profile picture
	So people know what I look like
	@selenium
	Scenario:
		Given I am logged in
		And The number of "Open tickets" is greater than 0
		When I click "Open tickets" in the tickets menu
		And I click on the top ticket
		And I upload "target.dat" in "ticket_attachment"
		And I press "Update ticket"
		Then i should see a link named "target.dat"
