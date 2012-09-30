class Committee < ActiveRecord::Base
  attr_accessible :name, :info, :contact_info, :website, :section_id, :section, :use_default_questions, :applications_open
  
  belongs_to :section
  default_scope includes(:section)

  has_many :nominations
  has_many :nominees, :through => :nominations, :uniq => true
  has_many :applications
  has_many :applicants, :through => :applications

  def nominees_and_applicants
    @n_and_a ||= (self.nominees + self.applicants).uniq
  end

  def nominations_for(nominee)
    self.nominations.find_all_by_nominee_id(nominee.id)
  end

  def nominators_for(nominee)
    self.nominations_for(nominee).map(&:nominator).map(&:name).join(", ")
  end

  def application_for(applicant)
    self.applications.find_by_applicant_id(applicant.id)
  end

  def date_for(nominee)
     (nominations_for(nominee) + [application_for(nominee)] ).map(&:updated_at).max
  end
end
