When /^I am an anonymous visitor$/ do
end

When /^I should see the site name$/ do
  page.has_content?('TestApp')
end

When /^I should see the registration area$/ do
  page.has_no_content?('Sign Up')
  page.has_content?('Sign Up')
#  page.has_selector?("div", :id => 'registration')

end
