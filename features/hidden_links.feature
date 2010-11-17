Feature: Hidden links
  In order to show links only to the correct types of users
  As the system
  I want to hide links from users who cannot use them
  
  Background:
    Given there is a user with the email address "user@example.com" and password "password"
    And "user@example.com" has confirmed their account
    Given there is an admin with the email address "admin@example.com" and password "password"
    And "admin@example.com" has confirmed their account
    And there is a project called "TextMate 2"
    Given I am on the homepage
    
  Scenario: New project link is hidden from anonymous visitors
    Then I should not see the "New Project" link
    
  Scenario: New project link is hidden from non-admin users
    Given I am signed in as "user@example.com"
    Then I should not see the "New Project" link
    
  Scenario: New project link is visible to admin users
    Given I am signed in as "admin@example.com"
    Then I should see the "New Project" link
    
  Scenario:  Edit project link is hidden from anonymous visitors
    When I follow "TextMate 2"
    Then I should not see the "Edit" link

  Scenario: Edit project link is hidden from non-admin users
    Given I am signed in as "user@example.com"
    When I follow "TextMate 2"
    Then I should not see the "Edit" link
  
  Scenario: Edit project link is visible to admin users
    Given I am signed in as "admin@example.com"
    When I follow "TextMate 2"
    Then I should see the "Edit" link
  
  Scenario:  Delete project link is hidden from anonymous visitors
    When I follow "TextMate 2"
    Then I should not see the "Delete" link

  Scenario: Delete project link is hidden from non-admin users
    Given I am signed in as "user@example.com"
    When I follow "TextMate 2"
    Then I should not see the "Delete" link

  Scenario: Delete project link is visible to admin users
    Given I am signed in as "admin@example.com"
    When I follow "TextMate 2"
    Then I should see the "Delete" link
  
  
  