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
    #Relacion con modelo User
    belongs_to :user
    #Relacion poliformica con comentarios
    has_many :comments, as: :commentable
    has_many :answers


    #Validaciones
    validates :topic, presence: true
    validates :description, presence: true
end
