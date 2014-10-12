module API
  class ZombiesController < ApplicationController
    def index
      zombies = Zombie.all
      render json: zombies, status: :ok
    end
  end
end
