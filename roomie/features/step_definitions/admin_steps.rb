Given(/^I am an administrator$/) do
  @administrator = FactoryGirl.create(:admin)
  #puts "admin created"
end

When(/^I visit the admin console$/) do
  visit '/admin'
  #puts "visited admin page"
end
