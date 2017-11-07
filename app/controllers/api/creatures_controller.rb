class Api::CreaturesController < ApplicationController
    def index 
        @creatures = Creatures.all 
        render json: @creatures
    
    end
    def create 
        creature_params = params.require(:creature).permit(:name, :description)
        @creature = Creature.new(creature_params)

        if @creature.save 
            render json: @creature

        end
    end
    def update
        creature_id = params[:id]
        @creature = Creature.find_by_id(creature_id)
        creature_params = params.require(:creature).permit(:name, :description)
        @creature.update_attrubutes(creature_params)
        render json: @creature
    end

  private
  
  def creature_params
    params.require(:creature).permit(:name, :description) 
  end

  def destroy
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
    creature.destroy
    render json:{
        msg: "Mission Successfully executed!"
    } 

  end

  end

