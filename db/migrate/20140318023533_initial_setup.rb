class InitialSetup < ActiveRecord::Migration
  def up
    create_table :logs do |t|
      t.text :content
      t.timestamp :timestamp
      t.timestamps
    end
  end

  def down
    drop_table :logs
  end
end