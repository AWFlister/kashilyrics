class Song < ApplicationRecord
    has_and_belongs_to_many :albums, join_table: "tracks"
    has_and_belongs_to_many :artists
    has_many :lyrics, dependent: :destroy
    belongs_to :language
    has_many :bookmarks, as: :bookmarkable, dependent: :destroy
end
