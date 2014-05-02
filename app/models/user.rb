class User < ActiveRecord::Base
  has_one :family
  has_one :sitter
  has_secure_password
  accepts_nested_attributes_for :family
  accepts_nested_attributes_for :sitter

  validates_presence_of :email
  validates_uniqueness_of :email
end