class CastMember < ApplicationRecord
  has_many :contributions
  has_many :episodes, through: :contributions
end
