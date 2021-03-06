Feature: Deleting Tickets
  In order to remove tickets
  As a user
  I want make them disappear
  
  Background:
    Given there is a user with the email address "user@example.com" and password "password"
    And I am signed in as them
    Given there is a project called "TextMate 2"
    And "user@example.com" can view the "TextMate 2" project
    And "user@example.com" can delete tickets on the "TextMate 2" project
    And "user@example.com" has created a ticket for this project:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"

  Scenario: Deleting a ticket
    When I follow "Delete"
    Then I should see "Ticket has been deleted."
    And I should be on the project page for "TextMate 2"  
