class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  has_many :transactions
  has_many :organizations
end
