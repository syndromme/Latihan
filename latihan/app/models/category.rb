class Category < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  has_many :child_categories, :class_name => "Category", :foreign_key => "parent_id"
  has_many :parent_category, :class_name => "Category", :foreign_key => "parent_id"

end
