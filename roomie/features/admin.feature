Feature: Admin Feature
  Scenario: administrator of the website should be able to login to the admin console
    Given I am an administrator
    When I visit the admin console
    Then I should fill "Email" with "admin@gmail.com"
    Then I should fill "Password" with "topsecret"
    Then I should click the sign in button
    Then I should see text: "Admin"
  