Feature: Permissions assignment
  In order to setup users with correct permissions
  As an admin
  I want to check all the boxes
  
  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@example.com | password | true  |
    And I am signed in as them
    
    Given there are the following users:
      | email             | password |
      | user@example.com | password |
    And there is a project called "TextMate 2"
    And "user@example.com" has created a ticket for this project:
      | title  | description       |
      | Shiny! | Eye-blindingly so |
#    Given there is a state called "Open"
 
    And there is a project called "Internet Explorer"
 
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@example.com"
    And I follow "Permissions"

  Scenario: Viewing a project
    When I check "View" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"
    
    Given I am signed in as "user@example.com"
    Then I should see "TextMate 2"     
    And I should not see "Internet Explorer"
    
  Scenario: Creating tickets for a project
    When I check "View" for "TextMate 2"
    When I check "Create Tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"
    
    Given I am signed in as "user@example.com"
    When I follow "TextMate 2"
    And I follow "New Ticket"
    And I fill in "Title" with "Shiny"
    And I fill in "Description" with "Make it so!"
    And I press "Save"
    Then I should see "Ticket has been created."

  Scenario: Updating tickets for a project
    When I check "View" for "TextMate 2"
    When I check "Edit Tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"

    Given I am signed in as "user@example.com"
    When I follow "TextMate 2"
    And I follow "Shiny"
    And I follow "Edit"
    And I fill in "Title" with "Really Shiny"
    And I press "Save"
    Then I should see "Ticket has been updated."

  Scenario: Creating tickets for a project
    When I check "View" for "TextMate 2"
    When I check "Delete Tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"

    Given I am signed in as "user@example.com"
    When I follow "TextMate 2"
    And I follow "Shiny"
    And I follow "Delete"
    Then I should see "Ticket has been deleted."
  
  
    