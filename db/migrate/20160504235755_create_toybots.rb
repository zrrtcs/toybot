class CreateToybots < ActiveRecord::Migration
  def change
    create_table :toybots do |t|
      t.integer :pos_x
      t.integer :pos_y
      t.string :face

      t.timestamps null: false
    end
  end
end
