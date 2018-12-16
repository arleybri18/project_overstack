# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(100)
#  password_digest :string
#  name            :string(100)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    #Metodo para manejo de password
    has_secure_password validations: false
    #Relacion uno a muchos con los modelos de questions y comments 
    has_many :questions
    has_many :comments
    
    #Validaciones
    validates :email, uniqueness: true, format: /@/
    validates :password, presence: true, on: :create
    validates :password, length: { in: 6..20 }, allow_nil: true
    validates :name, presence: true
end
