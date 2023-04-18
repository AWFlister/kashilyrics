class Album < ApplicationRecord
    has_and_belongs_to_many :artists, join_table: "discographies"
    has_and_belongs_to_many :songs, join_table: "tracks"
end
