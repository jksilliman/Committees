class Question < ActiveRecord::Base
  attr_accessor :answer
  attr_accessible :text, :answer

  # HACK
  attr_accessor :nomination_id
  attr_accessor :application_id


  # If we're designing a model question, it doesn't need an answer.
  validates :answer, :presence => true, :unless => Proc.new { |q| q.for_applicant || q.for_nominator }

  def to_hash
    {question: text, answer: answer}
  end
end
