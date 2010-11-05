# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require "email_spec"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, comment the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # include other modules (eg helper methods)
  # config.include(UserExampleHelperModule)
  
  # use email_spec
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)

end

# add other setup code here like
# def login_admin
# def login_user
# def login_editor
# etc...

# eg
if false
  def login_user(options = {})
    @logged_in_user = Factory.create(:user, options)
    @controller.stub!(:current_user).and_return(@logged_in_user)
    @logged_in_user
  end

  def login_admin(options = {})
    options[:admin] = true
    @logged_in_user = Factory.create(:user, options)
    @controller.stub!(:current_user).and_return(@logged_in_user)
    @logged_in_user
  end

  def logout_user
    @logged_in_user = nil
    @controller.stub!(:current_user).and_return(@logged_in_user)
    @logged_in_user
  end 
end