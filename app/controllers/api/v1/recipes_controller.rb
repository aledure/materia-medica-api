class Api::V1::RecipesController < ApplicationController

    def index
        @recipe = Recipe.all
        render json: @recipes
    end

    def show
        render json: @recipes
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            render json: @recipe, status: created
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def update
        if @recipe.update(recipe_params)
            render json: @recipe
        else
            render json: @recipe.errors, status: ::unprocessable_entity
        end
    end

    def destroy
        @recipe.destroy
    end

    private

    def recipe_params
        params.require(:recipe).permit (:body, :plant_id, :user_id)
    end
    
end
