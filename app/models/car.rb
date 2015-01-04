class Car < ActiveRecord::Base
  validates :manufacturer_id,
            :color,
            :year,
            :mileage,
            :name,
            presence: true
  validates :year,
            numericality: { greater_than: 1919 }

  belongs_to :manufacturer
end
