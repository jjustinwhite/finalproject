class List < ActiveRecord::Base
  attr_accessible :name
  has_many :books, :through => :items
  has_many :items, :dependent => :destroy
  belongs_to :user
end
