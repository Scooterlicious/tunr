class Musician < ActiveRecord::Base
  attr_accessible :name
  has_many :band_memberships
  has_many :bands, through: :band_memberships
end
