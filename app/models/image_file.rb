

class ImageFile < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :image

    validates :image, {
    presence: true
  }

  def get_url
    url_for(self.image)
  end

  def compare(hash)
    (hash.to_i^self.avg_hash.to_i).to_s(2).count("1")
  end

  #calculate the average hash for the image
  def process_img          
    a = MiniMagick::Image.open(ActiveStorage::Blob.service.send(:path_for, image.blob.key))
    a.resize "8x8"
    a.colorspace 'gray'
    pixels = a.get_pixels
    sum = 0
    hash = ''
    #calculate avg of 8x8 greyscale img
    pixels.each do |row|
        row.each do |pixel|
            sum += pixel[0]
        end
    end
    avg = sum/64
    #hash according to avg<val<avg
    pixels.each do |row|
        row.each do |pixel|
            if pixel[0]> avg
                hash += '1'
            else
                hash += '0'
            end
        end
    end
    self.avg_hash = hash
    
 end
end
