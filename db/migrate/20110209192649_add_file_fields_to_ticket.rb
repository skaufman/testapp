class AddFileFieldsToTicket < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      t.column :asset_file_name, :string
      t.column :asset_file_size, :integer
      t.column :asset_content_type, :string
      t.column :asset_updated_at, :datetime 
    end
  end

  def self.down
    change_table :tickets do |t|
      t.remove :asset_file_name
      t.remove :asset_file_size
      t.remove :asset_content_type
      t.remove :asset_updated_at
    end
  end
end
