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
end
