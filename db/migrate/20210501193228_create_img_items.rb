class CreateImgItems < ActiveRecord::Migration[6.1]
  def change
    create_table :img_items do |t|
      t.string :img_title
      t.string :img_user
      t.string :img_description
      t.timestamps
    end
  end
end
