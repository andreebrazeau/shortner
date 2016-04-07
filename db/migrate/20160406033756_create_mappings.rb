class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.string :url_hash
      t.text :long_url

      t.timestamps null: false
    end
  end
end
