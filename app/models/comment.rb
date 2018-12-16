# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_type :string
#  commentable_id   :integer
#

class Comment < ApplicationRecord
  #Relacion poliformica
  belongs_to :commentable, polymorphic: true
  #Relacion con modelo User
  belongs_to :user
 
end
