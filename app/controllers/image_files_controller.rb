class ImageFilesController < ApplicationController
    def create
        @imageFile = ImageFile.create!(image_params)
        process_img(imageFile.image)
        render json: @imageFile
      end
    
      private def image_params
        params.permit(:image_title, :image)
      end
    
    def index
        @imageFiles = ImageFile.all 
        render json: @imageFiles.map { |imageFile|
            imageFile.as_json.merge({ image: url_for((imageFile.process_img)) })
        }
    end 
      
end
