class Lyric < ApplicationRecord
  belongs_to :song
  belongs_to :language
end
