class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :room, index: true
      t.string :speaker
      t.string :body

      t.timestamps
    end
  end
end
