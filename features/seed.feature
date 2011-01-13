Feature: Seed data
  In order to fill the database with basic data
  As the system
  I want to run the seed task
  
  Scenario: The basics
    Given I have run the seed task
    And I am signed in as "god@example.com"
    Then I should see "TestApp Beta"
  
  
  

  
