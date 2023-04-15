class Album < ApplicationRecord
    has_and_belongs_to_many :artist, join_table: "discographies"
    has_and_belongs_to_many :songs, join_table: "tracks"
end
