class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :bookmarkable, polymorphic: true 

  validates_uniqueness_of :bookmarkable_id, scope: :user_id
end
