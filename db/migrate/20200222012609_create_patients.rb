class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :birthdate
      t.string :gender

      t.timestamps
    end
  end
end
