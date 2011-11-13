class Question < ActiveRecord::Base
  attr_accessor :answer
  attr_accessible :text, :answer, :for_nominator, :for_applicant, :committee_id

  belongs_to :committee

  # HACK
  attr_accessor :nomination_id
  attr_accessor :application_id



  # If we're designing a model question, it doesn't need an answer.
  validates :answer, :presence => true, :unless => Proc.new { |q| q.new_record? }

  def to_hash
    {question: text, answer: answer}
  end
end
