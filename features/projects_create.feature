Feature: Creating Projects
  In order to have projects for tickets
  As a user
  I want to create projects
  
  Scenario: Creating a Project
    Given I am on the homepage
    When I follow "New Project"
    And I fill in "Name" with "TextMate 2"
    And I press "Create Project"
    Then I should see "Project has been created."
  
  
  

  
