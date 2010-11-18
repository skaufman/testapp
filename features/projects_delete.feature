Feature: Deleting Projects
  In order to remove unwanted projects
  As a user
  I want to remove them. Duh.
  
  Scenario: Deleting a project
    Given there is a project called "TextMate 2"
    Given there is an admin with the email address "admin@example.com" and password "password"
    And I am signed in as them
    And I am on the homepage
    When I follow "TextMate 2"
    And I follow "Delete"
    Then I should see "Project has been deleted."
    And I should not see "TextMate 2"
  
  
  

  
