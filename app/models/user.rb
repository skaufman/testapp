class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable and 
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :tickets
  has_many :permissions
  
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
