When /^I must be admin$/ do
  User.first.update_attribute(:role, "admin")
end

When /^I fill in "([^\"]*)" with number "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value.to_d) 
end

Then /^I should have (\d+) products created$/ do |arg1|
  Product.all.count == arg1
end

Then /^I should have (\d+) order created$/ do |arg1|
  Order.all.count == arg1
end

Then /^"([^"]*)" role should be "([^"]*)"$/ do |user, role|
  User.find_by_email(user).role.should == role
end





