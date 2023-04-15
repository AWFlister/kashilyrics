class Lyric < ApplicationRecord
  belongs_to :song
  belongs_to :language
  has_many :bookmarks, as: :bookmarkable
end
