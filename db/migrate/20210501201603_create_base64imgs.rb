class CreateBase64imgs < ActiveRecord::Migration[6.1]
  def change
    create_table :base64imgs do |t|
      t.string :img_title
      t.string :img_data
      t.timestamps
    end
  end
end
