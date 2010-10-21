Feature: Signing in
  In order to use the site
  As a user
  I want to sign in
  
  Scenario: Logging in via confirmation
    Given there is an unconfirmed user with the email address "user@example.com" and password "password"
    And "user@example.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
    Then I should see "Signed in as user@example.com"
  

    