class ImgItemsController < ApplicationController
    def index
        @items = ImgItem.all 
        render json: @items
    end 

    def update
        @items = ImgItem.find(params[:id])
        @items.update(
            img_title: params[:img_title],
            img_user: params[:img_user],
            img_description: params[:img_description]
        )
        render json: @items
    end 

    def destroy
        @items = ImgItem.all 
        @items = ImgItem.find(params[:id])
        @items.destroy
        render json: @items
    end 
end
