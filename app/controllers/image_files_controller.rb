class ImageFilesController < ApplicationController
    def create
        @imageFile = ImageFile.create!(image_params)
        @imageFile.process_img
        @imageFile.save
        render json: @imageFile
      end
    def show
        @imageFile = ImageFile.where(image_title: params[:id])
        render json: @imageFile
    end

    #search by image upload
    #we could delete the search image
    #default to keeping it
    #hash.compare(image.avg_hash) < 20 could be any num from 0-64
    def search
        @imageFiles = ImageFile.all
        image = ImageFile.create!(image_params)
        image.process_img
        res = []
        for hash in @imageFiles
            if hash.compare(image.avg_hash) < 20
                res.append(hash)
            end
        end
        render json: res
    end
    
      private def image_params
        params.permit(:image_title, :image)
      end
    
    def index
        @imageFiles = ImageFile.all 
        render json: @imageFiles.map { |imageFile|
            imageFile.as_json.merge({ image: url_for((imageFile.image))})
        }
    end 
      
end
