Given /^I signin as (.*)$/ do |role|
  current_user = User.find_by_role(role)
end

When /^I go to (.*) page$/ do |page_name| 
  visit path_to(page_name)
end  



