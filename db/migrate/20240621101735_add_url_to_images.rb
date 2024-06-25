class AddUrlToImages < ActiveRecord::Migration[7.1]
  def change
    add_column :images, :url, :string
  end
end
