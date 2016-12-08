Then(/^I should click on combined username 2$/) do
  click_on("combined-username-2")
end

Then(/^I should see send message to combined username 2$/) do
  click_on("Send Message to combined-username-2")
  sleep 5
end

Then(/^I should see text: "([^"]*)"$/) do |arg1|
  assert_text(arg1)
end

Then(/^I should fill "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1 , :with => arg2
end

Then(/^I should select "([^"]*)" from : "([^"]*)"$/) do |arg1, arg2|
  page.select arg1, :from => arg2
end

Then(/^I should click on "([^"]*)" button$/) do |arg1|
  click_on(arg1)
end

Then(/^I confirm popup$/) do
  begin
    main, popup = page.driver.browser.window_handles
    within_window(popup) do
      click_on('OK')
    end
  rescue
  end
end


















