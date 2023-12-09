Feature: Search for representatives

Background: On the Representatives Page
  Given I am on the representatives page
  Then I should see "Search for a Representative"

Scenario: Search for representatives at a location
  When I fill in "address" with "2631 Sierra Vista Ct"
  And I press "Search"
  Then I should see "Joseph R. Biden"
  And I should see "Kamala D. Harris"
  And I should see "Christopher Murphy"
  And I should see "Richard Blumenthal"
  And I should see "Ned Lamont"
  And I should see "Susan Bysiewicz"
  And I should see "Stephanie Thomas"
  And I should see "Sean Scanlon"
  And I should see "William Tong"
  And I should see "Erick Russell"

Scenario: View a representatives profile
  When I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  And I click on the profile button for "Ken Calvert"
  Then I should see "2205 Rayburn House Office Building, Washington, DC, 20515"

Scenario: View the news articles of a representative
  When I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  And I click on the news button for "Ken Calvert"
  Then I should see "Listing News Articles for Ken Calvert"