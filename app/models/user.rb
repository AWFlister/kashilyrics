class User < ApplicationRecord
    has_secure_password
    has_many :bookmarks, dependent: :destroy
    validates_uniqueness_of :email, on: :create, message: "must be unique"
end
