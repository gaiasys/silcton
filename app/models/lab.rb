class Lab < ApplicationRecord
  has_many :experimenters, :dependent => :destroy
  has_many :studies, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end
