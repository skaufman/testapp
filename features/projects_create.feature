Feature: Creating Projects
  In order to have projects for tickets
  As a user
  I want to create projects
  
  Background: Setup for Creating a Project
    Given there is an admin with the email address "admin@example.com" and password "password"
    And I am signed in as them
    Given I am on the homepage
    When I follow "New Project"
  
  Scenario: Creating a Project
    And I fill in "Name" with "TextMate 2"
    And I press "Save"
    Then I should see "Project has been created."
    And I should be on the project page for "TextMate 2"
    And I should see "Show - Tickets - TestApp"
  
  Scenario: Creating a Project without a Name
    And I press "Save"
    Then I should see "Project has NOT been created."
    And I should see "Name can't be blank"
  
  
  
  
  

  
