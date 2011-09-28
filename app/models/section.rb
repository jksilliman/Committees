class Section < ActiveRecord::Base
  validates :name, :presence => true
  has_many :committees
end
