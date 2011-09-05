class Committee < ActiveRecord::Base
  attr_accessible :name, :info
  has_many :nominations
  has_many :nominees, :through => :nominations, :uniq => true
end
