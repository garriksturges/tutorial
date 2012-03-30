# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  validates_presence_of :name
  validates_presence_of :email
  validates_length_of :name, :within => 3..50
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => VALID_EMAIL_REGEX
  validates_uniqueness_of :email, case_sensitive: false
  validates_length_of :password, :within => 6..50
  has_secure_password
  validates_presence_of :password_confirmation
end
