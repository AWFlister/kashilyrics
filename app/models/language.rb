class Language < ApplicationRecord
    has_many :songs
    has_many :lyrics
end
