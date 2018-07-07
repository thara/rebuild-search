class Api::EpisodesController < ApplicationController
  serialization_scope :view_context

  # GET /episodes
  def index
    @episodes = Episode.all
    render json: @episodes, root: "episodes", adapter: :json
  end

end
