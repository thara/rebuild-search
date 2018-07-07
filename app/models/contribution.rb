class Contribution < ApplicationRecord
  belongs_to :episode
  belongs_to :cast_member
end
