module SeedHelpers
  def create_user!(attributes={})
    default_attributes = { :email => "user@example.com", :password => "password", :password_confirmation => "password"}
    user = Factory(:user, default_attributes.merge(attributes))
    user.confirm!
    user
  end
end

RSpec.configure do |config|
  config.include SeedHelpers
end