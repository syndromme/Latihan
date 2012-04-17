class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :user
  validates :title, :presence => true, :uniqueness => true
end
