class Song < ApplicationRecord
    has_and_belongs_to_many :albums, join_table: "tracks"
    has_and_belongs_to_many :artists
    has_many :lyrics
    belongs_to :language
end
