class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_many :transactions
  has_many :organizations
  validates :email, :uniqueness => true
  
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
  
end
