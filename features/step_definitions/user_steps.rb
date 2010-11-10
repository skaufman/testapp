When /^there is an? (unconfirmed)?\s?(admin|user) with the email address "([^\"]*)" and password "([^\"]*)"$/ do |unconfirmed, admin, email, password|
  @user = User.new(:email => email, :password => password, :password_confirmation => password)
  @user.admin = true if admin == "admin"
  @user.save!
  @user.confirm! unless unconfirmed
end

When /^"([^"]*)" has confirmed their account$/ do |email|
  @user = User.find_by_email(email)
end
