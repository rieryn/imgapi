module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
    field :image_title, String, null: true
    field :avg_hash, String, null:true
    field :image_url, String, null: false

    def image_url
      object.get_url()
    end
  end
end
