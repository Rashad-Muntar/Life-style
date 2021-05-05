class CategoriesController < ApplicationController

    def index
        @category = Category.find(params[:id])
        @categories = Category.all
    end

    def show
        @categories = Category.all
        @category = Category.find(params[:id])
        @articles = Article.all
    end
end