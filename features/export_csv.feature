Feature: Export ticket list as CSV
	As an authorized user
	I want to be able to export a list of tickets
	So that I can keep track of them in other applications
	And also to keep them when the Lighthouse test installation is deleted
	@selenium
	Scenario:
		Given I am logged in
		And The number of "All tickets" is greater than 0
		When I click "All tickets" in the tickets menu
		And I click "CSV"
		Then I should receive a valid CSV file
