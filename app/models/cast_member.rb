class CastMember < ApplicationRecord
  has_many :contribution
  has_many :episode, through: :contribution
end
