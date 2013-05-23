Feature: Upload big file
	As an authorised user
	I want to upload a big data file
	@selenium
	Scenario:
		Given I am logged in
		And The number of "Open tickets" is greater than 0
		When I click "Open tickets" in the tickets menu
		And I click on the top ticket
		And I upload "target.dat" in "ticket_attachment"
		And I press "Update ticket"
		Then I should see a link named "target.dat"
