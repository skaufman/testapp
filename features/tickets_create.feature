Feature: Creating Tickets
  In order to create a ticket for a project
  As a user
  I want to select a project and create a ticket
  
  Background:
    Given there is a project called "Internet Explorer"
    And there are the following users:
      | email            | password |
      | user@example.com | password |
    And "user@example.com" can view the "Internet Explorer" project
    And "user@example.com" can create tickets on the "Internet Explorer" project
    And I am signed in as them
    And I am on the homepage
    When I follow "Internet Explorer"
    And I follow "New Ticket"

  Scenario: Creating a new ticket
    When I fill in "Title" with "Non-standards compliance"
    And I fill in "Description" with "My pages are ugly!"
    And I press "Save"
    Then I should see "Ticket has been created."
    And I should see "Created by user@example.com"
    
  Scenario: Creating a new ticket with invalid data fails
    When I press "Save"
    Then I should see "Ticket has not been created."
    And I should see "Title can't be blank"
    And I should see "Description can't be blank"
  
  Scenario: Description must be longer than 10 characters
    When I fill in "Title" with "Non-standards compliance"
    And I fill in "Description" with "it sucks"
    And I press "Save"
    Then I should see "Ticket has not been created."
    And I should see "Description is too short (minimum is 10 characters)"

  Scenario: Creating a ticket with an attachment
    When I fill in "Title" with "Add documentation for blink tag"
    And I fill in "Description" with "The blink tag has an undocumented speed attribute"
    And I attach the file "spec/fixtures/speed.txt" to "File"
#    And I attach the file "spec/fixtures/speed.txt" to "File #1"
#    And I follow "Add another file"
#    And I attach the file "spec/fixtures/spin.txt" to "File #2"
    And I press "Save"
    Then I should see "Ticket has been created."
    And I should see "speed.txt" within "#ticket .assets"
#    And I should see "spin.txt" within "#ticket .assets"
  
  
  