class Nomination < ActiveRecord::Base
  include Questionable
  has_questions_for "nominator"
  
  
  
  belongs_to :committee
  belongs_to :nominee, :class_name => "User"
  belongs_to :nominator, :class_name => "User"

  attr_accessible :committee_id

  validates :committee, :presence => true, :associated => true
  validates :nominee, :presence => true, :associated => true
  validates :nominator, :presence => true, :associated => true

  validate :cannot_nominate_self
  def cannot_nominate_self
    if nominee == nominator
      self.errors.add(:nominee, " is invalid")
      self.nominee.errors.add(:username, " cannot nominate yourself")
    end
  end

  validate :cannot_renominate
  def cannot_renominate
    nom = Nomination.find(:first, :conditions => {:committee_id => committee_id, :nominator_id => nominator_id, :nominee_id => nominee_id})

    if nom
      self.errors.add(:nominee, " is invalid")
      self.nominee.errors.add(:username, " cannot renominate someone for a committee.")
    end
  end  

  # Allow nomination of (formerly) unregistered users
  attr_accessible :nominee_attributes
  def nominee_attributes=(attr)
    self.nominee = User.find_or_initialize_by_username(attr["username"])
  end
end
