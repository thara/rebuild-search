class Episode < ApplicationRecord
  has_many :contribution
  has_many :cast_member, through: :contribution
end
