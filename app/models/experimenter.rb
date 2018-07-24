class Experimenter < ApplicationRecord

  belongs_to :lab
  has_many :studies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :email, :lab
  validates_uniqueness_of :email

  def full_name
    "#{first_name} #{last_name}"
  end


  def name
  	full_name
  end
end
