class CreateTeamEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :team_events do |t|
      t.belongs_to :team
      t.belongs_to :event
      t.decimal :points, precision: 6, scale: 3

      t.timestamps
    end
  end
end
