class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.string :email, null: false, index: true
      t.text :visual, null: false

      t.timestamps
    end
  end
end
