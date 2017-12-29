class Movie < ApplicationRecord
mount_uploader :photo,PhotoUploader
has_many :comments, dependent: :destroy 

has_many :views, dependent: :destroy
has_many :users, through: :comments
  validates_presence_of :title, :cast, :plot, :photo, :rating, :genre
  validates :rating, numericality: { less_than_or_equal_to: 10 }


def self.search(search)
  where("title LIKE ?", "%#{search}%") 
end


end

