Feature: Creating Tickets
  In order to create a ticket for a project
  As a user
  I want to select a project and create a ticket
  
  Background:
    Given there is a project called "Internet Explorer"
    And there is a user with the email address "user@example.com" and password "password"
    And "user@example.com" has confirmed their account
    And I am on the homepage
    When I follow "Internet Explorer"
    And I follow "New Ticket"
    Then I should see "You need to sign in or sign up before continuing."
    When I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Sign In"
    Then I should see "New Ticket"
  
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
  
  
  
  
  
  
  
  

  
