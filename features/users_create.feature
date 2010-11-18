Feature: Creating Users
  In order to add new users to the system
  As an admin
  I want to add them via an admin-only UI
  
  Background:
    Given there is an admin with the email address "admin@example.com" and password "password"
    And I am signed in as them
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Users"
    And I follow "New User"
    
  Scenario: Creating a new user
    And I fill in "Email" with "newbie@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "password"
    And I press "Save"
    Then I should see "User has been created."
    
  Scenario: Leaving email blank produces error
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "password"
    And I press "Save"
    Then I should see "User has not been created."
    And I should see "Email can't be blank"
  
  Scenario: Creating an admin user
    When I fill in "Email" with "newadmin@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "password"
    And I check "Is an admin?"
    And I press "Save"
    Then I should see "User has been created."
    And I should see "newadmin@example.com (Admin)"
  
  
  
  
  
  
  

  
