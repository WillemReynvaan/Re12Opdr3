Feature: Add profile picture
  As an authorised user
  I want to change my profile picture
  So people know what i look like
  @selenium
    Scenario:
		Given I am logged in
		When I click on my username
		And I click on "Edit Profile"
		And I upload "Crash_Test_Dummy.jpg" in "user_avatar"
		And I press "Save profile"
		
		Then I should see "profile was updated"
		And the location of the image should include ".jpg"
		
		When I upload "png-file.png" in "user_avatar"
		And I press "Save profile"
		
		Then I should see "profile was updated"
		And the location of the image should include ".png"
