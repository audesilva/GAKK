Given(/^I am an existing user with a profile and a preference$/) do
  @@user_with_both_1 = FactoryGirl.create(:user_with_both_1)
end

Given(/^I am an existing user with a profile and a partial preference$/) do
  @@user_with_both_4 = FactoryGirl.create(:user_with_both_4)
end

Given(/^other users exist with profiles that are similar\.$/) do
  @user_with_both_2 = FactoryGirl.create(:user_with_both_2)
end

Given(/^other users exist with profiles that are dissimilar\.$/) do
  @user_with_both_3 = FactoryGirl.create(:user_with_both_3)
end

Then(/^I should fill in the field email with: (.*)$/) do |email|
  fill_in 'Email', :with => email
end

Then(/^I should fill in my field password with: (.*)$/) do |password|
  fill_in 'Password', :with => password
end

Then(/^I should see the matches button\.$/) do
  assert_text 'Matches'
end

Then(/^I click on matches button\.$/) do
  click_on('Matches') 
end

Then(/^I should see user (.*)$/) do |user_name|
  assert_text user_name
end

Then(/^I should not see user (.*)$/) do |user_name|
  assert_no_text user_name
end

Then(/^I should see a matching value of (.*)$/) do |value|
  assert_text value
end

Then(/^I should see no matches found$/) do
  assert_text 'No matches found.  Please update your profile and preferences.' 
end

