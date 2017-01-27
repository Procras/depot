class Product < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  validates :description, :image_url, :price, presence: true
end
