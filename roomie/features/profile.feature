# feature/profile.feature

Feature: Profile Feature

Scenario: A user should be able to create a profile without an address
    Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: No
    Then I should submit Create Profile
    Then I should see profile created.

Scenario: A user should be able to create a profile with an address
    Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: Yes
    Then I should fill out my street: 100 Broadway
    Then I should fill out my city: New York
    Then I should select my state: NY
    Then I shoudl fill out my postal code: 10027
    Then I should submit Create Profile
    Then I should see profile created.



Scenario: A user without an address should not be able to save a profile if any of the non-address fields are blank
	Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: No
    Then I should submit Create Profile
    Then I should see an error telling me my smoking status can't be blank




Scenario: A user with an address should not be able to save a profile if any fields are blank
    Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: Yes
    Then I should fill out my city: New York
    Then I should select my state: NY
    Then I shoudl fill out my postal code: 10027
    Then I should submit Create Profile
    Then I should see an error telling me my street can't be blank


Scenario: A user should not be able to select a username that another user has selected
	Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: existing-username
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: No
    Then I should submit Create Profile
    Then I should get an error telling me my username must be unique




Scenario: A user should not be able to enter a postal code that is more than 5 digits
	Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: Yes
    Then I should fill out my street: 100 Broadway
    Then I should fill out my city: New York
    Then I should select my state: NY
    Then I shoudl fill out my postal code: 100271
    Then I should submit Create Profile
    Then I should see an error that the post code must be 5 digits


Scenario: A user should not be able to enter a postal code that is less than 5 digits
	Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: Yes
    Then I should fill out my street: 100 Broadway
    Then I should fill out my city: New York
    Then I should select my state: NY
    Then I shoudl fill out my postal code: 1002
    Then I should submit Create Profile
    Then I should see an error that the post code must be 5 digits

Scenario: A user should only be able to enter an integer for the postal code
	Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: Yes
    Then I should fill out my street: 100 Broadway
    Then I should fill out my city: New York
    Then I should select my state: NY
    Then I shoudl fill out my postal code: codes
    Then I should submit Create Profile
    Then I should see an error that the post code must be a number




Scenario: A user with an address should not be able to add a street with special characters
    Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: Yes
    Then I should fill out my street: @100 Broadway@
    Then I should fill out my city: New York
    Then I should select my state: NY
    Then I shoudl fill out my postal code: 10027
    Then I should submit Create Profile
    Then I should see an error that I can only input numbers and letters



Scenario: A user with an address should not be able to add a city with special characters
    Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: Yes
    Then I should fill out my street: 100 Broadway
    Then I should fill out my city: @New York@
    Then I should select my state: NY
    Then I shoudl fill out my postal code: 10027
    Then I should submit Create Profile
    Then I should see an error that I can only input numbers and letters


Scenario: A user should not be able to enter a username with special characters
    Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: @test@
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: No
    Then I should submit Create Profile
    Then I should see an error that I can only input numbers and letters




Scenario: A user without an address should be able to edit their profile
    Given I am an existing user with a profile
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my email 
    Then I should fill in password with my password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the edit user profile button
    Then I click on Edit User Profile link
    Then I should see the edit profile form
    Then I should select my gender: Male
    Then I should submit Update Profile
    Then I should see profile updated



Scenario: A user with an address should be able to edit their profile
    Given I am an existing user with a profile
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my email 
    Then I should fill in password with my password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the edit user profile button
    Then I click on Edit User Profile link
    Then I should see the edit profile form
    Then I shoudl fill out my postal code: 10028
    Then I should submit Update Profile
    Then I should see profile updated

@javascript
Scenario: A user who updates their profile to no longer have an address and saves it should have their old address deleted
    Given I am an existing user 
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: Yes
    Then I should fill out my street: 100 Broadway
    Then I should fill out my city: New York
    Then I should select my state: NY
    Then I shoudl fill out my postal code: 10027
    Then I should submit Create Profile
    Then I should see profile created.
    Then I click on Edit User Profile link
    Then I should see the edit profile form
    Then I should select my residence status: No
    Then I should submit Update Profile
    Then I should see profile updated
    Then I click on Edit User Profile link
    Then I should see the edit profile form
    Then I should select my residence status: Yes
    Then I should fill out my street: 100 Broadway
    Then I should fill out my city: New York
    Then I should select my state: NY
    Then I should submit Update Profile
    Then I should get an error saying the postal code can't be blank

Scenario: When a user creates a valid profile the longitude and latitute fields should be autofilled
    Given I am an existing user
    When I go to the homepage
    Then I should see a login button
    Then I should click on the login button
    Then I should visit the login page
    Then I should fill in email with my existing email
    Then I should fill in my password with my existing password
    Then I should click the sign in button
    Then I should see Signed in successfully.
    Then I should see the create user profile button
    Then I click on Create User Profile link
    Then I should see the profile form
    Then I should fill in my username: test-name
    Then I should select my gender: Female
    Then I should select my smoking status: No
    Then I should select my pet status: No
    Then I should select my cleanliness: Neat. Freak.
    Then I should select my outgoingness: Not even at the party
    Then I should select my quietnessness: You probably won't know I'm home
    Then I should select my residence status: Yes
    Then I should fill out my street: 100 Broadway
    Then I should fill out my city: New York
    Then I should select my state: NY
    Then I shoudl fill out my postal code: 10027
    Then I should submit Create Profile
    Then I longitute and latitude should not be blank




