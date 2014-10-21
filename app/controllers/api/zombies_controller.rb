module API
  class ZombiesController < ApplicationController
    def index
      @zombies = Zombie.all
      weapon = Weapon.where(name: params[:weapon]).first
      puts "#{weapon}"
      if weapon
        @zombies = @zombies.where(id: weapon.zombie_id)
      end
      puts "zombies are #{@zombies.first.to_json}"
      respond_to do |format|
        #format.json {render json: @zombies, status: :ok }
        format.json
        format.xml { render xml: @zombies, status: :ok }
      end
    end

    def show
      zombie = Zombie.find(params[:id])
      render json: zombie, status: :ok
    end
  end
end
