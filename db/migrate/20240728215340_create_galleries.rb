class CreateGalleries < ActiveRecord::Migration[7.1]
  def change
    create_table :galleries do |t|
      t.text :photo
      t.string :description

      t.timestamps
    end
  end
end
