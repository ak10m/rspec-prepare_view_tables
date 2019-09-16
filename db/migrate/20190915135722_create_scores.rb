class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.references  :user
      t.date        :scored_on
      t.integer     :point

      t.timestamps
    end
  end
end
