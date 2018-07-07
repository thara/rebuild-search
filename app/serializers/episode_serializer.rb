class EpisodeSerializer < ActiveModel::Serializer
  attributes :episode_no, :title, :link, :description, :subtitle
end
