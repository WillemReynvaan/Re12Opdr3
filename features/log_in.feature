Feature: Log in
  I want to log in
  So i can access the site
	@selenium
	Scenario:
		Given I am at the login page
		When I fill in my e-mail address
		And I fill in my password
		And I press on "Sign In"
		Then I should see "Signed in successfully"
