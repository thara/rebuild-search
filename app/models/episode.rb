class Episode < ApplicationRecord
  has_many :contributions
  has_many :cast_members, through: :contributions
end
