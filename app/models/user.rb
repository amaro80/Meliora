class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         has_one :profiles
         has_many :vineyards
         has_many :wines
         accepts_nested_attributes_for :vineyards
         accepts_nested_attributes_for :wines
end
