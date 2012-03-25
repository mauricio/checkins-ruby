class CreateResources < ActiveRecord::Migration

  def up
    create_table :resources do |t|
      t.string :name, :null => false
      t.text   :description, :null => false
      t.string :type, :null => false
      t.has_attached_file :image
      t.timestamps
    end

    create_table :checkins do |t|
      t.integer :resource_id, :null => false
      t.integer :user_id, :null => false
      t.text    :comment
      t.float   :latitude
      t.float   :longitude
      t.has_attached_file :image
      t.timestamps
    end

    create_table :follows do |t|
      t.integer :owner_id, :null => false
      t.integer :followed_id, :null => false
      t.timestamps
    end

    add_index :checkins, :resource_id
    add_index :checkins, :user_id

    add_index :follows, [:owner_id, :followed_id], :unique => true
    add_index :follows, [:followed_id, :owner_id], :unique => true

    add_index :resources, :type

  end

  def down
    drop_table :resources
    drop_table :checkins
    drop_table :follows
  end

end
