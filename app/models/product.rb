class Product < ActiveRecord::Base
  has_many :metafields, :dependent => :destroy
end
