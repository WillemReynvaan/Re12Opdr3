Feature: Create Milestone
	As an authorized user
	I want to be able to create milestones
	And I want to be able to add milestones to tickets
	So that the milestones are tracked
	@selenium
	Scenario:
		Given I am logged in
		And The number of "All tickets" is greater than 0
		When I click "Milestones"
		And I click "New milestone"
		And I fill in "Milestone title" with "Test milestone"
		And I press "Add milestone"
		Then I should see "Milestone was created successfully"
		And the milestone should have a title "Test milestone"

		When I click "All tickets" in the tickets menu
		And I click on the top ticket
		And I change the "Milestone" to the new milestone
		And I press "Update ticket"
		Then the ticket should have the new milestone
