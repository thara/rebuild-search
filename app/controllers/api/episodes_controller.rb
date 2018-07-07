class Api::EpisodesController < ApplicationController

  # GET /episodes
  def index
    episodes = Episode.all
    render json: ActiveModel::ArraySerializer.new(
        episodes,
        each_serializer: EpisodeSerializer
      ).to_json
  end

end
