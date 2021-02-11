class Api::V1::PlantsController < ApplicationController

    def index 
        @plants = Plant.all
        render json: @plants
    end

    def show 
        @recipe = Recipe.where(plant_id: params[:id])
        render json: { plant: @plant, recipes: @recipes }
    end

    def create
        @plant = Plant.new(plant_params)
        if @plant.save
            render json: @plant
        else
            render json: @plant.errors, status: :unprocessable_entity
        end
    end

    def update
        if @plant.update(plant_params)
            render json: @plant
        else
            render json: @plant.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @plant.destroy
    end

    def get_upload_credentials
        @accessKey = ENV['S3_ACCESS']
        @secertKey = ENV ['S3_SECERT']
        render json: { accessKey: @accessKey, secertKey: @secertKey }
    end

    private
    #Methods we place in private can only be accessed by other methods in our movies controller

    def set_plant
        @plant = Plant.find(params[:id])
    end

    def plant_params
        params.require(:plant).permit(:name, :uses, :extraction_methods, :effects, :growing_zone, :image, :description, :interactions)
    end

end
