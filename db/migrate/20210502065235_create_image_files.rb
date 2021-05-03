class CreateImageFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :image_files do |t|

      t.string :image_title
      t.string :avg_hash
      t.timestamps
    end
  end
end
