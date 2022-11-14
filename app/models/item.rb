class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :ship_charge
  belongs_to :prefecture
  belongs_to :ship_date

  belongs_to :user
  has_one_attached :image
end
