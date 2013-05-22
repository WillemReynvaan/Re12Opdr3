Feature: Create Milestone
	As an authorized user
	I want to be able to create milestones
	And I want to be able to add milestones to tickets
	So that the milestones are tacked
	@selenium
	Scenario:
		Given I am logged in
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
		Then the ticket should be shown with a title "Test"
		And the ticket should have the new milestone
