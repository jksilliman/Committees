class Committee < ActiveRecord::Base
  attr_accessible :name, :info, :contact_info, :website
  has_many :nominations
  has_many :nominees, :through => :nominations, :uniq => true
  has_many :applications
  has_many :applicants, :through => :applications

  def nominees_and_applicants
    @n_and_a ||= (self.nominees + self.applicants).uniq
  end

  def nominators_for(nominee)
    self.nominations.find_all_by_nominee_id(nominee.id).map(&:nominator).map(&:name).join(", ")
  end

  def application_for(applicant)
    self.applicants.find_by_id(applicant.id)
  end
end
