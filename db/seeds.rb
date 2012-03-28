#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8
Product.delete_all
Product.populate 100 do | product |
  product.title = Populator.words(3..5)
  product.description = Populator.sentences(4..8)
  product.image_url = [ "/images/wd4d.jpg", "/images/ruby.jpg", "/images/rtp.jpg" ]
  product.price = [ 40.23, 58.32, 33.99, 104.27, 140,45 ]
end
User.delete_all
User.transaction do
   (1..40).each do |i|
      User.create(:email => "user#{i}@host.com", :password => "user#{i}",
      :password_confirmate => "user#{i}" )
   end
end
User.first.update_attribute(:role, "admin")
Payment.delete_all
Payment.create(:name => "Check")
Payment.create(:name => "Credit card")
Payment.create(:name => "Purchase order") 