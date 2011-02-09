# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#require 'factory_girl'
Dir[Rails.root + "factories/*.rb"].each do |file|
  require file
end

admin_user = Factory(:user, :email => "god@example.com")
admin_user.admin = true
admin_user.confirm!

Factory(:project, :name => "TestApp Beta")