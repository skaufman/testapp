Feature: Editing Projects
  In order to update Project information
  As a user
  I want to use a good UI

  Background:
    Given there is a project called "TextMate 2"
    And I am on the homepage
    When I follow "TextMate 2"
    And I follow "Edit"
  
  Scenario: Updating a Project
    And I fill in "Name" with "TextMate 2 beta"
    And I press "Save"
    Then I should see "Project has been updated."
    And I should be on the project page for "TextMate 2 beta"
  
  Scenario: Updating a Project with invalid attributes fails
    And I fill in "Name" with "" 
    And I press "Save"
    Then I should see "Project has not been updated."
  
  
  
  

  
