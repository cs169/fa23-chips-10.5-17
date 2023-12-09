Feature: Add a new news item

  As a user of actionmap
  So that I can contribute information about elected officials
  I want to be able to add news items about them

Background:
  When I am on the login page
  Then I should see "Select an authentication provider below to login."
  Then I should see "Sign in with Google"
  And I should see "Sign in with GitHub"
  And I press "Sign in with Google"
  When I am on the login page
  Then I should see "Your Profile"

Scenario: adding news and editing
  When I am on the representatives page
  And I fill in "address" with "ca"
  And I press "commit"
  Then I should see "Fiona Ma"
  And I follow "news-Fiona Ma"
  Then I should see "Listing News Articles for"
  And I should see "Fiona Ma"
  Then I follow "Add News Article"
  And I should see "Create News Article"
  When I choose "Free Speech" from the "selected_issue" dropdown
  And I choose "Fiona Ma" from the "selected_representative" dropdown
  And I press "commit"
  Then I should see "Edit News Item"
  And I press "commit"
  Then I should see "News item was successfully created."
  And I press "commit"
  When I follow "Edit"
  Then I should see "Edit news article"
  Then I should see "News item was successfully updated."
