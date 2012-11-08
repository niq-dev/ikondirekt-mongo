Feature: Create Enquiries
  In order to send a enquiry to partnrs
  As an customer or new user
  I want to create a enquiries

  Scenario: Create Valid Enquiry
    Given I habe no enquiry
    And I am on the home
    When I follow "New Enquiry"
    Then I should see "Create a new Enquiry"
