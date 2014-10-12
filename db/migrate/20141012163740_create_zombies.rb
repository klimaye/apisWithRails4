class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      t.string :name
      t.integer :age
      t.string :weapon

      t.timestamps
    end
  end
end
