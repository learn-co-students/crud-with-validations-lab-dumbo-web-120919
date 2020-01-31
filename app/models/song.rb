class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true 
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true

end
