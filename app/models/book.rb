class Book < ActiveRecord::Base
  attr_accessible :author, :name
  has_many :list, :through => :items
  has_many :items, :dependent => :destroy
end
