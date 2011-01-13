Feature: Permissions assignment
  In order to setup users with correct permissions
  As an admin
  I want to check all the boxes
  
  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as them
    
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
      | title  | description       |
      | Shiny! | Eye-blindingly so |
#    Given there is a state called "Open"
 
    And there is a project called "Internet Explorer"
 
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@ticketee.com"
    And I follow "Permissions"

  Scenario: Viewing a project
    When I check "View" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"
    
    Given I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"     
    And I should not see "Internet Explorer"
    
  Scenario: Creating tickets for a project
    When 
    Then outcome
  
  
    