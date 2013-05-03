Feature: Create Issue
	As an authorized user
	I want to be able to add issues to public projects
	So that the issue is tracked
	Scenario:
		Given I am logged in
		And I am on the issues page for the WillemReynvaan/RE12Opdr3 project
		And The number of issues is X
		When I press "New issue"
		And I fill in "Title" with "Test"
		And I fill in "Comment" with "This is a test"
		And I press "Submit new issue"
		Then the issue should be shown
		And the number of issues should be X+1
