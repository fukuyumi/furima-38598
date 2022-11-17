class ShipDate < ActiveHash::Base
  self.data = [
    { id: 1, ship_date: '---' },
    { id: 2, ship_date: '1~2日で発送' },
    { id: 3, ship_date: '2~3日で発送' },
    { id: 4, ship_date: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
