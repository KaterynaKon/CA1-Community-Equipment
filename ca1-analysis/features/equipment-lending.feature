Feature: Recording loan requests
  In order to assess a loan request and record a decision
  As Office Staff
  I want to record equipment loan requests

  # SC-01 - Related to FR-01
  Scenario: Record a complete loan request
    Given an Office Staff member has received a request from Local Sports Club
    And the request includes 10 chairs
    And the request includes a collection date of 10 November 2026
    And the request includes a return date of 12 November 2026
    When Office Staff records the loan request
    Then the service records the request
    And the request is available for assessment


  Rule: A request cannot be assessed untill required information is recorded

  # SC-02 - Related to FR-01 and NFR-02
  Scenario: Record a request with missing required information
    Given Office Staff has received a request for 10 chairs
    And the request does not include a return date
    When Office Staff records the loan request
    Then the service records the request as pending further information
    And the request cannot be assessed until the required information is recorded

Feature: Restricted volunteer access
    In order to protect borrower privacy
    As Riverside Community Partnership
    I want volunteers to have only the information needed for their tasks

    # SC-03 - Related to NFR-01
    Scenario: Volunteer records an equipment return with limited access
        Given a Volunteer is authorised to record equipment retrurns
        And an issued loan has deposit information
        And the loan contains borrower personal information
        When the Volunteer opens the return record
        Then the Volunteer can record the return information
        And the Volunteer cannot view deposit information
        And the Volunteer cannot view personal data not required to record the return


