When /^I must be admin$/ do
  User.first.update_attribute(:role, "admin")
end

When /^I fill in "([^\"]*)" with number "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value.to_d) 
end

Then /^I should have (.+) products created$/ do |count|
  Product.count.should == count.to_i
end

Then /^I should have (.+) order created?$/ do |count|
  Order.count.should == count.to_i
end

Then /^"([^"]*)" role should be "([^"]*)"$/ do |user, role|
  User.find_by_email(user).role.should == role
end

Then /^"([^"]*)" price must be "([^"]*)"$/ do |title, price|
  Product.find_by_title(title).price.should == price.to_d
end  

Then /^I should see (.*) created users$/ do |count|
  User.count.should == count.to_i
end 