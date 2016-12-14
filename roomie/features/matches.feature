Feature: As a user, I should be able select matches among other users based on profiles and preferences.

  Scenario: User has a profile and preference and similar users exist.
    Given I am an existing user with a profile and a preference
    Given other users exist with profiles that are similar.
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in the field email with: combined_user_1@gmail.com
    Then I should fill in my field password with: top_secret
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the matches button.
    Then I click on matches button.
    Then I should see user combined-username-2
    Then I should see a matching value of 87


  Scenario: User has a profile and  partial preferences and similar users exist.
    Given I am an existing user with a profile and a partial preference
    Given other users exist with profiles that are similar.
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in the field email with: combined_user_4@gmail.com
    Then I should fill in my field password with: top_secret
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the matches button.
    Then I click on matches button.
    Then I should see user combined-username-2
    Then I should see a matching value of 79
    
  Scenario: User has a profile and preference and no similar users exist.
    Given I am an existing user with a profile and a preference
    Given other users exist with profiles that are dissimilar.
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in the field email with: combined_user_1@gmail.com
    Then I should fill in my field password with: top_secret
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the matches button.
    Then I click on matches button.
    Then I should not see user combined-username-3
    Then I should see no matches found

  Scenario: User matches update when user edits profile and preferences.
    Given I am an existing user with a profile and a preference
    Given other users exist with profiles that are similar.
    Given other users exist with profiles that are dissimilar.
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in the field email with: combined_user_1@gmail.com
    Then I should fill in my field password with: top_secret
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the matches button.
    Then I click on matches button.
    Then I should see user combined-username-2
    Then I should see a matching value of 87
    Then I click on edit user preferences
    Then I should select my gender preference: Male
    Then I should select my smoking preference: Yes
    Then I should select my pets preference: Yes
    Then I should select my cleanliness preference: I expect the apartment to sparkle
    Then I should submit edit preferences
    Then I click on Edit User Profile link
    Then I should select my gender: Male
    Then I should select my smoking status: Yes
    Then I should select my pet status: Yes
    Then I should select my cleanliness: Neat. Freak.
    Then I should submit Update Profile
    Then I should see profile updated
    Then I should see the matches button.
    Then I click on matches button.
    Then I should see user combined-username-3
    Then I should see a matching value of 75
    Then I should not see user combined-username-2