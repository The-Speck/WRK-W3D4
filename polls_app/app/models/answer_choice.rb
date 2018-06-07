# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint(8)        not null, primary key
#  body        :text             not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ApplicationRecord
  
  validates :body, :question_id, presence: true
  
  belongs_to :question,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :Question
    
  has_many :responses,
    foreign_key: :answerchoice_id,
    primary_key: :id,
    class_name: :Response
end
