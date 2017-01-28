class Product < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  validates :description, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: false, format:
  {  with: %r{\.(gif|jpg|png)\Z}i, message: "must be a URL for GIF, JPG or PNG image." }
  end
