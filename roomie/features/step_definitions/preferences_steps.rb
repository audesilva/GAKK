

Then(/^I should see the create user preferences button$/) do
  find_link('Create User Preferences').visible?
end
    

Then(/^I click on create user preferences$/) do
  click_on('Create User Preferences') 
end
    

Then(/^I should see the preferences form$/) do
  assert_text 'Preferences'
end
    

Then(/^I should select my gender preference: (.*)$/) do |pref_gender|
  select(pref_gender, :from => 'preferences_gender')
  @pref_gender = pref_gender
end
    

Then(/^I should select my smoking preference: (.*)$/) do |pref_smoker|
  select(pref_smoker, :from => 'preferences_smoker')
  @pref_smoker = pref_smoker
end
    

Then(/^I should select my pets preference: (.*)$/) do |pref_pet_friendly|
  select(pref_pet_friendly, :from => 'preferences_pet_friendly')
  @pref_pet_friendly = pref_pet_friendly
end
    

Then(/^I should select my cleanliness preference: (.*)$/) do |pref_cleanliness_level|
  select(pref_cleanliness_level, :from => 'preferences_cleanliness_level')
  @pref_cleanliness_level = pref_cleanliness_level
end
    

Then(/^I should select my outgoing preference: (.*)$/) do |pref_outgoingness_level|
  select(pref_outgoingness_level, :from => 'preferences_outgoingness_level')
  @pref_outgoingness_level = pref_outgoingness_level
end
    

Then(/^I should select my quietness preference: (.*)$/) do |pref_quietness_level|
  select(pref_quietness_level, :from => 'preferences_quietness_level')
  @pref_quietness_level = pref_quietness_level
end
    

Then(/^I should select my residence preference: (.*)$/) do |pref_residence|
  if pref_residence == 'Yes'
    check('looking_for_residence')
  else
    uncheck('looking_for_residence')
  end
  @pref_residence = pref_residence
end
    

Then(/^I should select my street preference: (.*)$/) do |pref_street|
  fill_in 'street_address', :with => pref_street
  @pref_street = pref_street
end
    

Then(/^I should select my city preference: (.*)$/) do |pref_city|
  fill_in 'city', :with => pref_city
  @pref_city = pref_city
end
    

Then(/^I should select my state preference: (.*)$/) do |pref_state|
  select(pref_state, :from => 'state')
  @pref_state = pref_state
end
    

Then(/^I should select my postal code preference: (.*)$/) do |pref_postal_code|
  fill_in 'postal_code', :with => pref_postal_code
  @pref_postal_code = pref_postal_code
end
    

Then(/^I should submit the update$/) do
  click_on('Create Preferences') 
end

Then(/^I should submit edit preferences$/) do
  click_on('Update Preferences') 
end

Then(/^I should see preferences updated.$/) do
  assert_text 'Preferences were successfully created.'
end

When(/^I click on edit user preferences$/) do
  click_on('Edit User Preferences') 
end

When(/^I click on show preference$/) do
  click_on 'Show'
end

Then(/^I should see error message$/) do
  assert_text 'error'
end


Then(/^I should fail to select my street preference: (.*)$/) do |pref_street|
  assert_no_text 'street address'
end
