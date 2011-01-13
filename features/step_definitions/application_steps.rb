When /^I should see the "([^"]*)" link$/ do |text|
  css("a").detect { |a| a.text == text}.should_not(be_nil, "Expected to see the #{text.inspect} link, but did not.")
end

When /^I should not see the "([^"]*)" link$/ do |text|
  css("a").detect { |a| a.text == text}.should(be_nil, "Expected not to see the #{text.inspect} link, but did.")
end

def css(selector)
  Nokogiri::HTML(body).css(selector)
end

When /^I have run the seed task$/ do
  load Rails.root + "db/seeds.rb"
end
