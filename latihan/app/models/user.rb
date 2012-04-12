class User < ActiveRecord::Base

  has_many :products, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
