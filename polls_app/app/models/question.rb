# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  body       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  
  validates :body, :poll_id, presence: true
  
  belongs_to :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Poll
    
  has_many :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :AnswerChoice
    
  has_many :responses,
    through: :answer_choices,
    source: :responses 
end
