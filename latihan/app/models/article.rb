class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belong_to :user

end
