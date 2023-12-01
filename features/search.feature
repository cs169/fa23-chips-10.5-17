Feature: Search representatives based on different criteria

  As a civic-minded individual
  So that I can find information about my representatives
  I want to search for representatives based on different criteria

Background: representatives have been added to the database

  Given the following representatives exist:
  | name              | title           | party       | state | district |
  | John Doe          | Representative  | Democratic  | NY    | 12       |
  | Jane Chung        | Senator         | Republican  | CA    | 7        |
  | Michael Johnson   | Representative  | Independent | TX    | 22       |
  | Emily Smith       | Senator         | Democratic  | FL    | 3        |
  | David Lee         | Representative  | Republican  | OH    | 15       |
  | Sarah Williams    | Senator         | Independent | WA    | 5        |
  | Brian Davis       | Representative  | Democratic  | PA    | 8        |
  | Rachel Brown      | Senator         | Republican  | IL    | 4        |
  | Kevin Kim         | Representative  | Democratic  | MI    | 14       |
  | Laura Rodriguez   | Senator         | Republican  | AZ    | 2        |

  And I am on the CivicInfo home page
  Then 10 seed representatives should exist

Scenario: search representatives by name
  When I fill in "Name" with "John Doe"
  And I press "Search"
  Then I should see "John Doe" in the search results
  And I should not see other representatives

Scenario: search representatives by party
  When I select "Democratic" from "Party"
  And I press "Search"
  Then I should see "John Doe" in the search results
  And I should see "Emily Smith" in the search results
  And I should see "Brian Davis" in the search results
  And I should see "Kevin Kim" in the search results
  And I should not see other representatives

Scenario: search representatives by state
  When I select "TX" from "State"
  And I press "Search"
  Then I should see "Michael Johnson" in the search results
  And I should not see other representatives

# Add more scenarios for additional search criteria as needed
