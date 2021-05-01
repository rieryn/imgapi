class ImgItemsController < ApplicationController
    def index
        @secretMenuItems = ImgItem.all 
        render json: @secretMenuItems
    end 

    def show
        @secretMenuItem = ImgItem.find(params[:id])
        render json: @secretMenuItem
    end 

    def create
        @secretMenuItem = ImgItem.create(
            menu_name: params[:menu_name],
            restaurant_name: params[:restaurant_name],
            menu_description: params[:menu_description]
        )
        render json: @secretMenuItem
    end 

    def update
        @secretMenuItem = ImgItem.find(params[:id])
        @secretMenuItem.update(
            menu_name: params[:menu_name],
            restaurant_name: params[:restaurant_name],
            menu_description: params[:menu_description]
        )
        render json: @secretMenuItem
    end 

    def destroy
        @secretMenuItems = ImgItem.all 
        @secretMenuItem = ImgItem.find(params[:id])
        @secretMenuItem.destroy
        render json: @secretMenuItems
    end 
end
