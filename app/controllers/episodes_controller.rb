class EpisodesController < ApplicationController

  def create
    episode = Episode.new(episode_params)
    if episode.save
      render json: episode, status: :created, location: episode
    end
  end

  def show

  end

  private
  def episode_params
    params.require(:episode).permit(:title, :description)
  end
end
