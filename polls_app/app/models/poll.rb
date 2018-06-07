# == Schema Information
#
# Table name: polls
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  pollster_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Poll < ApplicationRecord
  
  validates :title, :pollster_id, presence: true
  
  belongs_to :author,
    foreign_key: :pollster_id,
    primary_key: :id,
    class_name: :User
    
  has_many :questions,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Question
end
