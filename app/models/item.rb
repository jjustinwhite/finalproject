class Item < ActiveRecord::Base
  attr_accessible :book_id, :list_id
  belongs_to :list
  belongs_to :book
end
