password_reset_user = FactoryGirl.create(:password_reset_user)

Given(/^I am an existing user$/) do
  @@existing_user = FactoryGirl.create(:existing_user)
end

When(/^I go to the homepage$/) do
  visit '/'
end

Then(/^I should fill in my email$/) do
  fill_in 'Email', :with => 'new_user@gmail.com'
end

Then(/^I should fill in my password$/) do
  fill_in 'Password', :with => 'topsecret' 
end

Then(/^I should fill in my password confirmation$/) do
  fill_in 'Password confirmation', :with => 'topsecret'
end

Then(/^I should click on sign up button$/) do
  click_on("Sign up") 
end

Then(/^I should see Your email address has been successfully confirmed\.$/) do
  assert_text('Your email address has been successfully confirmed.')
end

Then(/^I should see a login button$/) do
  find_link('Login').visible?
end

Then(/^I should click on the login button$/) do
  click_on("Login")
end

Then(/^I should visit the login page$/) do
  visit new_user_session_path
end


Then(/^I should fill in email with my email$/) do
  fill_in 'Email', :with => @existing_user.email
end

Then(/^I should fill in password with my password$/) do
  fill_in 'Password', :with => @existing_user.password
end

Then(/^I should click the sign in button$/) do
  click_on("Sign in")
end

Then(/^I should see Signed in successfully\.$/) do
  assert_text('Signed in successfully.')
end

#for test 3


Then(/^I should fill in email with my existing email$/) do
  fill_in 'Email', :with => 'existing_user@gmail.com'

end

Then(/^I should fill in my password with my existing password$/) do
  fill_in 'Password', :with => 'top secret'
end

Then(/^I should fill in my password confirmation with my existing password$/) do
  fill_in 'Password confirmation', :with => 'top secret'
end

Then(/^I should Email has already been taken$/) do
  assert_text('Email has already been taken')
end

#for test 4
Then(/^I should fill in email with an non_existant email$/) do
  fill_in 'Email', :with => "non_existant_user@gmail.com"
end

Then(/^I should fill in password with an non_existant password$/) do
  fill_in 'Password', :with => "non_existant_password"
end

Then(/^I should see Invalid Email or password\.$/) do
  assert_text('Invalid Email or password.')
end



#for test 5
Given(/^I am an unconfirmed user$/) do
  unconfirmed_user = FactoryGirl.create(:unconfirmed_user)
end

Then(/^I should fill in email with an unconfirmed_user email$/) do
  fill_in 'Email', :with => 'unconfirmed_user@gmail.com'
end

Then(/^I should fill in password with an unconfirmed_user password$/) do
  fill_in 'Password', :with => 'top secret'
end

Then(/^I should see You have to confirm your email address before continuing\.$/) do
  assert_text('You have to confirm your email address before continuing.')
end

#for test 6
Then(/^I should fill in my password confirmation that does not match the password$/) do
  fill_in 'Password confirmation', :with => "password"
end

Then(/^I should see Password confirmation doesn't match Password\.$/) do
  assert_text("Password confirmation doesn't match Password")
end


#for test 7


Then(/^I should click on the forgotten password link$/) do
  click_on('Forgot password')
end

Then(/^I should enter my email address$/) do
  fill_in 'Email', :with => password_reset_user.email
end

Then(/^I should click on reset password button$/) do
  click_on("Reset Password")
end

Then(/^I should not see Email not found\.$/) do
  !has_text?("Email not found")
end

Then(/^I should see You will receive an email with instructions on how to reset your password in a few minutes\.$/) do
  assert_text("You will receive an email with instructions on how to reset your password in a few minutes.")
end

Then(/^I should fill in New password$/) do
  fill_in 'New password', :with => "new_password"
end

Then(/^I should fill in Confirm new password$/) do
  fill_in 'Confirm new password', :with => "new_password"
end

Then(/^I should click on Change my Password button$/) do
  click_on('Change my Password')
end


Then(/^I should see Your password has been changed successfully\. You are now signed in\.$/) do
  assert_text('Your password has been changed successfully. You are now signed in.')
end

#An existing user should be able to reset the password

Then(/^I should click on Edit Account$/) do
   click_on("Edit Account")
end

Then(/^I should fill in Password with the new password$/) do
  fill_in 'Password', :with => "new_password"
end

Then(/^I should fill in Password confirmation with the new password$/) do
  fill_in 'Password confirmation', :with => "new_password"
end

Then(/^I should fill in Current password with the existing password$/) do
  fill_in 'Current password', :with => 'top secret'
end

Then(/^I should click on update button$/) do
   click_on("Update")
end


Then(/^I should see Your account has been updated successfully\.$/) do
  assert_text("Your account has been updated successfully.")
end

#An non existing user should not be able use the forgotten password feature

Then(/^I should see Email not found\.$/) do
  assert_text("Email not found")
end

Then(/^I should click on Cancel my account button$/) do
   click_on("Cancel my account")
   page.driver.browser.switch_to.alert.accept
end

Then(/^I should see cancel account confirmation$/) do
  assert_text("Bye! Your account has been successfully cancelled.")
end