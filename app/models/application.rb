class Application < ActiveRecord::Base
  include Questionable
  has_questions_for "applicant" 




  belongs_to :committee
  belongs_to :applicant, :class_name => "User", :autosave => true
  
  #accepts_nested_attributes_for :applicant
  attr_accessible :applicant_attributes
  def applicant_attributes=(attr)
    self.applicant.assign_attributes(attr, :as => :applicant)
  end


  attr_accessible :committee_id

  validates :committee, :presence => true, :associated => true
  validates :applicant, :presence => true, :associated => true


  validate :cannot_reapply
  def cannot_reapply
    nom = Application.find(:first, :conditions => {:committee_id => committee_id, :applicant_id => applicant_id})

    if nom
      errors.add(:applicant_name, "You cannot reapply for a committee.")
    end
  end 
end
