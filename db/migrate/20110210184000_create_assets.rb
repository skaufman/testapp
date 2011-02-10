class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :asset_file_name
      t.integer :asset_file_size
      t.string :asset_content_type
      t.datetime :asset_updated_at
      t.integer :ticket_id
      t.timestamps
    end
    
    change_table :tickets do |t|
      t.remove :asset_file_name
      t.remove :asset_file_size
      t.remove :asset_content_type
      t.remove :asset_updated_at      
    end
  end

  def self.down
    change_table :tickets do |t|
      t.column :asset_file_name, :string
      t.column :asset_file_size, :integer
      t.column :asset_content_type, :string
      t.column :asset_updated_at, :datetime 
    end

    drop_table :assets
  end
end
