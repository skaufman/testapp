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
    And "user@example.com" can view the "TextMate 2" project
    And "user@example.com" has created a ticket for this project:
      | title  | description       |
      | Shiny! | My eyes! My eyes! |
    And I am on the homepage
        
  Scenario: New project link is hidden from non-admin users
    Given I am signed in as "user@example.com"
    Then I should not see the "New Project" link
    
  Scenario: New project link is visible to admin users
    Given I am signed in as "admin@example.com"
    Then I should see the "New Project" link
    
  Scenario: Edit project link is hidden from non-admin users
    Given I am signed in as "user@example.com"
    When I follow "TextMate 2"
    Then I should not see the "Edit" link
  
  Scenario: Edit project link is visible to admin users
    Given I am signed in as "admin@example.com"
    When I follow "TextMate 2"
    Then I should see the "Edit" link
  
  Scenario: Delete project link is hidden from non-admin users
    Given I am signed in as "user@example.com"
    When I follow "TextMate 2"
    Then I should not see the "Delete" link

  Scenario: Delete project link is visible to admin users
    Given I am signed in as "admin@example.com"
    When I follow "TextMate 2"
    Then I should see the "Delete" link
  
  Scenario: New ticket link is visible to user with perms
    Given "user@example.com" can view the "TextMate 2" project
    And "user@example.com" can create tickets on the "TextMate 2" project
    And I am signed in as "user@example.com"
    When I follow "TextMate 2"
    Then I should see "New Ticket"
    
  Scenario: New ticket link is hidden from user without perms
    Given "user@example.com" can view the "TextMate 2" project
    And I am signed in as "user@example.com"
    When I follow "TextMate 2"
    Then I should not see "New Ticket"
  
  Scenario: New ticket link is visible to admin user
    Given I am signed in as "admin@example.com"
    When I follow "TextMate 2"
    Then I should see "New Ticket"
  
  Scenario: Edit ticket link is visible to user with perms
    Given "user@example.com" can view the "TextMate 2" project
    And "user@example.com" can edit tickets on the "TextMate 2" project
    And I am signed in as "user@example.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should see "Edit"
  
  Scenario: Edit ticket link is not visible to user without perms
    Given "user@example.com" can view the "TextMate 2" project
    And I am signed in as "user@example.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should not see "Edit"
  
  Scenario: Edit ticket is visible to admin user
    Given I am signed in as "admin@example.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should see "Edit"
  
  Scenario: Delete ticket link is visible to user with perms
    Given "user@example.com" can view the "TextMate 2" project
    And "user@example.com" can delete tickets on the "TextMate 2" project
    And I am signed in as "user@example.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should see "Delete"
  
  Scenario: Delete ticket link is not visible to user without perms
    Given "user@example.com" can view the "TextMate 2" project
    And I am signed in as "user@example.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should not see "Delete"
  
  Scenario: Delete ticket link is visible to admin user
    Given I am signed in as "admin@example.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should see "Delete"
  
  
  
  
  