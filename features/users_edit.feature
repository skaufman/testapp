Feature: Editing Users
  In order to change a user's details
  As an admin
  I want to modify them via an admin-only UI
  
  Background:
    Given there is an admin with the email address "admin@example.com" and password "password"
    And I am signed in as them
    And there is a user with the email address "user@example.com" and password "password"
    Given I am on the homepage
    And I follow "Admin"
    And I follow "Users"
    And I follow "user@example.com"
    And I follow "Edit"
    
  Scenario: Updating user's details
    When I fill in "Email" with "new_address@example.com"
    And I press "Save"
    Then I should see "User has been updated."
    And I should see "new_address@example.com (User)"
    And I should not see "user@example.com"
  
  Scenario: Toggling a user's admin status
    When I check "Is an admin?"
    And I press "Save"
    Then I should see "User has been updated."
    And I should see "user@example.com (Admin)"
  
  Scenario: Updating with bogus email should fail
    When I fill in "Email" with "bogus"
    And I press "Save"
    Then I should see "User has not been updated."
    And I should see "Email is invalid"
  
  
  
  
  

  
