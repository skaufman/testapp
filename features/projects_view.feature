Feature: Viewing Projects
  In order to assign tickets to projects
  As a user
  I want to list all projects
  
  Background:
    Given there is a user with the email address "user@example.com" and password "password"
    And I am signed in as them
    And there is a project called "TextMate 2"
    And "user@example.com" can view the "TextMate 2" project
  
  Scenario: Listing all projects
    Given I am on the homepage
    When I follow "TextMate 2"
    Then I should be on the project page for "TextMate 2"
  
  
  