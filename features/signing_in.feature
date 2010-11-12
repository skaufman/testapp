Feature: Signing in
  In order to use the site
  As a user
  I want to sign in
  
  Background:
    Given there is a user with the email address "user@example.com" and password "password"
    
  Scenario: Logging in via confirmation
    Given there is an unconfirmed user with the email address "user1@example.com" and password "password"
    And "user1@example.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
    Then I should see "Signed in as user1@example.com"
  
  Scenario: Signing in via form
    Given "user@example.com" has confirmed their account
    And I am signed in as them
  
    