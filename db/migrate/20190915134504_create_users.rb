class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.integer :gender
      t.date    :birthday

      t.timestamps
    end
  end
end
