module API
  class ZombiesController < ApplicationController
    def index
      zombies = Zombie.all
      if weapon = params[:weapon]
        zombies = zombies.where(weapon: weapon)
      end
      render json: zombies, status: :ok
    end
  end
end
