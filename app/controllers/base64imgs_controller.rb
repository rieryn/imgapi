class Base64imgsController < ApplicationController
    def index
        @base64imgs = Base64img.all 
        render json: @base64imgs
    end 

    def create
        @base64img = Base64img.create(
            img_title: params[:img_title],
            img_data: params[:img_data],
        )
        render json: @base64img
    end 
    def destroy
        @base64imgs = Base64img.all 
        @base64imgs = Base64img.find(params[:id])
        @base64imgs.destroy
        render json: @base64imgs
    end 
end
