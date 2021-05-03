

class ImageFile < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :image

    validates :image, {
    presence: true
  }
  
  def get_url
    url_for(self.image)
  end

  def process_img      
    # Download the attached file in temp dir
    
    a = MiniMagick::Image.open(ActiveStorage::Blob.service.send(:path_for, image.blob.key))
    a.resize "8x8"
    a.colorspace 'gray'
    pixels = a.get_pixels
    sum = 0
    hash = ''
    pixels.each do |row|
        row.each do |pixel|
            sum += pixel[0]
        end
    end
    avg = sum/64
    pixels.each do |row|
        row.each do |pixel|
            if pixel[0]> avg
                hash += '1'
            else
                hash += '0'
            end
        end
    end
    hash
    # process the downloaded file
    # ...
 end
end
