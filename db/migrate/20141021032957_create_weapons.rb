class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :name
      t.references :zombie
      t.timestamps
    end
  end
end
