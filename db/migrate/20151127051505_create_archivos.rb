class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.date :fecha
      t.string :nombre

      t.timestamps null: false
    end
  end
end
