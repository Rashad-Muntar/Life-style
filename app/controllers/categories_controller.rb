class CategoriesController < ApplicationController

    def index
    end

    def show
        @categories = Category.all
        @category = Category.find(params[:id])
    end
end