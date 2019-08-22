class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.timestamp :conducted_at

      t.timestamps
    end
  end
end
