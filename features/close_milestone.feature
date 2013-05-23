Feature: Close Milestone
	As an authorized user
	I want to be able to close milestones
	Even when that milestone contains open tickets
	So i can close milestones quickly
	@selenium
	Scenario:
		Given I am logged in
		And there is a milestone with open tickets
		When I click on a milestone with open tickets
		And I click "Close milestone"
		Then I should see "Milestone was closed"
