Feature: Viewing Projects
  In order to assign tickets to projects
  As a user
  I want to list all projects
  
  Background:
    Given there is a user with the email address "user@example.com" and password "password"
    And I am signed in as them
    And there is a project called "TextMate 2"
    And there is a project called "Internet Explorer"
    And "user@example.com" can view the "TextMate 2" project
    
  Scenario: Listing all projects
    Given I am on the homepage
    Then I should not see "Internet Explorer"
    And I should see "TextMate 2"
    
  Scenario: Viewing one project
    Given I am on the homepage
    Then I should see "TextMate 2"
    When I follow "TextMate 2"
    Then I should be on the project page for "TextMate 2"
  
  
  
#    When I follow "TextMate 2"
#    Then I should be on the project page for "TextMate 2"
  
  
  