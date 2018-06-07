# == Schema Information
#
# Table name: responses
#
#  id              :bigint(8)        not null, primary key
#  answerchoice_id :integer          not null
#  user_id         :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Response < ApplicationRecord
  
  validates :answerchoice_id, :user_id, presence: true
  
  belongs_to :answer_choice,
    foreign_key: :answerchoice_id,
    primary_key: :id,
    class_name: :AnswerChoice
    
  belongs_to :respondent,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User
    
  has_one :question, 
    through: :answer_choice,
    source: :question
    
  
  
  def sibling_responses
    self.question.responses.where.not("responses.id = ?", self.id)
  end
    
end
