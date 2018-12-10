# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  topic       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Question < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :topic, presence: true
    validates :description, presence: true
end
