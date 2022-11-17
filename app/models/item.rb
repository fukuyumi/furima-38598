class Item < ApplicationRecord
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_status_id
    validates :ship_charge_id
    validates :prefecture_id
    validates :ship_date_id
  end

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :image, unless: :was_attached?
    validates :category_id
    validates :item_status_id
    validates :ship_charge_id
    validates :prefecture_id
    validates :ship_date_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :ship_charge
  belongs_to :prefecture
  belongs_to :ship_date

  def was_attached?
    image.attached?
  end
end
