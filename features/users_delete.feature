Feature: Deleting Users
  In order to remove users
  As an admin
  I want to delete them
  
  Background:
    Given there is an admin with the email address "admin@example.com" and password "password"
    And I am signed in as them
    And there is a user with the email address "user@example.com" and password "password"
    Given I am on the homepage
    And I follow "Admin"
    And I follow "Users"
  
  Scenario: Deleting a user
    When I follow "user@example.com"
    And I follow "Delete"
    Then I should see "User has been deleted."
  
  Scenario: User should not delete himself
    When I follow "admin@example.com"
    And I follow "Delete"
    Then I should see "You cannot delete yourself."
  
  
  
  
  

  
