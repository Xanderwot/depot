class User < ActiveRecord::Base

  belongs_to :cart, :dependent => :destroy
  has_many :orders, :dependent => :destroy

  ROLE_TYPES = [ "admin", "user" ]		
  	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
