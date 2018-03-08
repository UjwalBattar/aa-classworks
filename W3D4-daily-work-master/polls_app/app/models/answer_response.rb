# == Schema Information
#
# Table name: answer_responses
#
#  id         :integer          not null, primary key
#  answer_id  :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnswerResponse < ApplicationRecord
  validates :answer_id, :user_id, presence: true

  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :answer_id

    belongs_to :respondent,
      class_name: :User,
      primary_key: :id,
      foreign_key: :user_id
end
