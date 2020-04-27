class Experimenter < ApplicationRecord

  belongs_to :lab
  has_many :studies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :email, :lab
  validates_uniqueness_of :email
  validate :strong_password

  def full_name
    "#{first_name} #{last_name}"
  end


  def name
  	full_name
  end
  
  def strong_password
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
