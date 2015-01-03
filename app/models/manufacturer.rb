class Manufacturer < ActiveRecord::Base
  validates :name, :country, presence: :true
  validates :name, uniqueness: { case_sensitive: false }
end
