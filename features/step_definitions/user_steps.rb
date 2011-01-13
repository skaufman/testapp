When /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed")
    @user = User.create!(
      attributes.merge!(
        :password_confirmation => attributes[:password]
      )
    )
    @user.admin = true if attributes["admin"] == "true"
    @user.confirm! unless unconfirmed
  end
end

When /^there is an? (unconfirmed)?\s?(admin|user) with the email address "([^\"]*)" and password "([^\"]*)"$/ do |unconfirmed, admin, email, password|
  @user = User.new(:email => email, :password => password, :password_confirmation => password)
  @user.admin = true if admin == "admin"
  @user.save!
  @user.confirm! unless unconfirmed
end

When /^"([^"]*)" has confirmed their account$/ do |email|
  @user = User.find_by_email(email)
end

When /^I am signed in as "([^"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("When I am signed in as them")
end

When /^I am signed in as them$/ do
  steps(%Q{
    Given I am on the homepage
    When I follow "Sign In"
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "password"
    And I press "Sign In"
    Then I should see "Signed in successfully"
  })
end
