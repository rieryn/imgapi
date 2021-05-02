class ImageFilesController < ApplicationController
    def create
        @imageFile = ImageFile.create!(image_params)
        render json: @imageFile
      end
    
      private def image_params
        params.permit(:image_title, :image)
      end
    
    def index
        @imageFiles = ImageFile.all 
        render json: @imageFiles.map { |imageFile|
            imageFile.as_json.merge({ image: url_for(imageFile.image) })
        }
    end 
      
end
