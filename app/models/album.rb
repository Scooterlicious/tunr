class Album < ActiveRecord::Base
	attr_accessible :name
  belongs_to :band
  has_many :song_recordings
end