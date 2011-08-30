class Nomination < ActiveRecord::Base
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
      errors.add(:nominee, "You cannot nominate yourself")
    end
  end

  validate :cannot_renominate
  def cannot_renominate
    nom = Nomination.find(:first, :conditions => {:committee_id => committee_id, :nominator_id => nominator_id, :nominee_id => nominee_id})

    if nom
      errors.add(:nominee, "You cannot renominate someone for a committee.")
    end
  end  

  # Allow nomination of (formerly) unregistered users
  attr_accessible :username
  attr_accessor :username
  before_validation :load_nominee
  
  def load_nominee
    puts self.username
    self.nominee = User.find_or_create_by_username(self.username)
  end

end
