Then(/^I should see the create user profile button$/) do
  find_link('Create User Profile').visible?
end

Then(/^I should see the edit user profile button$/) do
  find_link('Edit User Profile').visible?
end


Then(/^I click on Create User Profile link$/) do
  click_on('Create User Profile') 
end

Then(/^I should see the profile form$/) do
  assert_text 'New Profile'
end

Then(/^I should see the edit profile form$/) do
  assert_text 'Editing Profile'
end


Then(/^I should fill in my username: (.*)$/) do |prof_username|
  if prof_username == 'existing-username'
    dummy_user = FactoryGirl.create(:user_with_profile)
  end
  fill_in 'profile_user_name', :with => prof_username
  @prof_username = prof_username
end

Then(/^I should select my gender: (.*)$/) do |prof_gender|
  select(prof_gender, :from => 'profile_gender')
  @prof_gender = prof_gender
end

Then(/^I should select my smoking status: (.*)$/) do |prof_smoking|
  select(prof_smoking, :from => 'profile_is_a_smoker')
  @prof_smoking = prof_smoking
end

Then(/^I should select my pet status: (.*)$/) do |prof_pet|
  select(prof_pet, :from => 'profile_pet_friendly')
  @prof_pet = prof_pet
end

Then(/^I should select my cleanliness: (.*)$/) do |prof_cleanliness|
  select(prof_cleanliness, :from => 'profile_cleanliness_level')
  @prof_cleanliness = prof_cleanliness
end

Then(/^I should select my outgoingness: (.*)$/) do |prof_outgoingness|
  select(prof_outgoingness, :from => 'profile_outgoingness_level')
  @prof_outgoingness = prof_outgoingness
end

Then(/^I should select my quietnessness: (.*)$/) do |prof_quietness|
  select(prof_quietness, :from => 'profile_quietness_level')
  @prof_quietness = prof_quietness
end

Then(/^I should select my residence status: (.*)$/) do |prof_residence_status|
  if prof_residence_status == 'Yes'
    check('has_residence_already')
  else
    uncheck('has_residence_already')
  end
  @prof_residence_status = prof_residence_status
end


Then(/^I should submit Create Profile$/) do
  click_on('Create Profile') 
end

Then(/^I should see profile created\.$/) do
  assert_text 'Profile was successfully created.'
end


Then(/^I should fill out my street: (.*)$/) do |prof_street|
  fill_in 'street_address', :with => prof_street
  @prof_street = prof_street
end

Then(/^I should fill out my city: (.*)$/) do |prof_city|
  fill_in 'city', :with => prof_city
  @prof_city = prof_city
end

Then(/^I should select my state: (.*)$/) do |prof_state|
  select(prof_state, :from => 'state')
  @prof_state = prof_state
end

Then(/^I shoudl fill out my postal code: (.*)$/) do |prof_postal|
  fill_in 'postal_code', :with => prof_postal
  @prof_postal = prof_postal
end

Then(/^I should see an error telling me my smoking status can't be blank$/) do
  assert_text "Is a smoker can't be blank"
end

Then(/^I should see an error telling me my street can't be blank$/) do
  assert_text "Street can't be blank"
end


Then(/^I should get an error telling me my username must be unique$/) do
  assert_text "User name has already been taken"
end

Then(/^I should see an error that the post code must be (\d+) digits$/) do |arg1|
  assert_text "Postal code is the wrong length (should be 5 characters)"
end

Then(/^I should see an error that the post code must be a number$/) do
  assert_text "Postal code is not a number"
end


Then(/^I should see an error that I can only input numbers and letters$/) do
  assert_text "only allows letters, spaces, numbers and dashes"
end


Then(/^I click on Edit User Profile link$/) do
  click_on("Edit User Profile")
end


Then(/^I should submit Update Profile$/) do
  click_on('Update Profile') 
end

Then(/^I should see profile updated$/) do
  assert_text "Profile was successfully updated." 
end

Given(/^I am an existing user with a profile$/) do
  @existing_user = FactoryGirl.create(:user_with_profile)
end

Given(/^my profile has an address$/) do
  puts @existing_user.profile.postal_code
end

Then(/^I should get an error saying the postal code can't be blank$/) do
  assert_text "Postal code can't be blank"
end

Then(/^I longitute and latitude should not be blank$/) do
  expect(@@existing_user.profile.latitude)
  expect(@@existing_user.profile.longitude)

end

