class Api::EpisodesController < ApplicationController
  serialization_scope :view_context

  # GET /episodes
  def index
    q = Episode.all

    unless params[:note].blank?
      note = params[:note].to_s
      q = q.where('title LIKE ?', "%#{note}%").or(Episode.where('description LIKE ?', "%#{note}%"))
    end
    unless params[:title].blank?
      q = q.where('title LIKE ?', "%#{params[:title].to_s}%")
    end
    unless params[:cast].blank?
      q = q.joins(:contribution, :cast_member).where('cast_members.name LIKE ?', "%#{params[:cast].to_s}%").uniq
    end

    @episodes = q
    render json: @episodes, root: "episodes", adapter: :json
  end

end
