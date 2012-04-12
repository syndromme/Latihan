class Product < ActiveRecord::Base
  belong_to :user
  belong_to :category
end
