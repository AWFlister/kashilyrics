class Language < ApplicationRecord
    belongs_to :song
    belongs_to :lyric
end
