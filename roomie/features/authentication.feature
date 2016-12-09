# feature/authentication.feature

Feature: Authentication Feature

Scenario: A new user should be able to sign up
When I go to the homepage
Then I should fill in my email
Then I should fill in my password
Then I should fill in my password confirmation
Then I should click on sign up button
Then "new_user@gmail.com" should receive an email
When I open the email
Then I should see "Confirmation instructions" in the email subject
Then I should see "Confirm my account" in the email body
#When I follow "confirm" in the email
When I click the first link in the email
Then I should see Your email address has been successfully confirmed.

Scenario: An existing user should be able to sign in.
Given I am an existing user
When I go to the homepage
Then I should see a login button
Then I should click on the login button
Then I should visit the login page
Then I should fill in email with my existing email
Then I should fill in my password with my existing password
Then I should click the sign in button
Then I should see Signed in successfully.

Scenario: An existing user should not be able to sign up again
Given I am an existing user
When I go to the homepage
Then I should fill in email with my existing email
Then I should fill in my password with my existing password
Then I should fill in my password confirmation with my existing password
Then I should click on sign up button
Then I should Email has already been taken

Scenario: An non existing user should not be able to sign in
When I go to the homepage
Then I should see a login button
Then I should click on the login button
Then I should visit the login page
Then I should fill in email with an non_existant email
Then I should fill in password with an non_existant password
Then I should click the sign in button
Then I should see Invalid Email or password.

Scenario: An unconfirmed user should not be able to sign in
Given I am an unconfirmed user
When I go to the homepage
Then I should see a login button
Then I should click on the login button
Then I should visit the login page
Then I should fill in email with an unconfirmed_user email
Then I should fill in password with an unconfirmed_user password
Then I should click the sign in button
Then I should see You have to confirm your email address before continuing.

Scenario: An user with mismatched password and password confirmation should not be able to sign up
When I go to the homepage
Then I should fill in my email
Then I should fill in my password
Then I should fill in my password confirmation that does not match the password
Then I should click on sign up button
Then I should see Password confirmation doesn't match Password.

Scenario: An user with forgotten password should be able to create a new password
Given I am an existing user
When I go to the homepage
Then I should see a login button
Then I should click on the login button
Then I should click on the forgotten password link
Then I should fill in email with my existing email
Then I should click on reset password button
Then I should not see Email not found.
Then I should see You will receive an email with instructions on how to reset your password in a few minutes.
Then "existing_user@gmail.com" should receive an email
When I open the email
Then I should see "Reset password instructions" in the email subject
Then I click the first link in the email
Then I should fill in New password
Then I should fill in Confirm new password
Then I should click on Change my Password button
Then I should see Your password has been changed successfully. You are now signed in.

Scenario: An existing user should be able to reset the password
Given I am an existing user
When I go to the homepage
Then I should click on the login button
Then I should fill in email with my existing email
Then I should fill in my password with my existing password
Then I should click the sign in button
Then I should click on Edit Account
Then I should fill in Password with the new password
Then I should fill in Password confirmation with the new password
Then I should fill in Current password with the existing password
Then I should click on update button
Then I should see Your account has been updated successfully.

Scenario: An non existing user should not be able use the forgotten password feature
When I go to the homepage
Then I should see a login button
Then I should click on the login button
Then I should click on the forgotten password link
Then I should fill in email with an non_existant email
Then I should click on reset password button
Then I should see Email not found.
