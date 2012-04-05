class User < ActiveRecord::Base

  belongs_to :cart, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :messages, :dependent => :destroy

  validates :email, :presence => true, :uniqueness => true 

  ROLE_TYPES = [ "admin", "user" ]		
  	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
