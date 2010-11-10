When /^that project has a ticket:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |ticket|
    @project.tickets.create!(ticket)
  end
end
