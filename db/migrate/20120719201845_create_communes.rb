class CreateCommunes < ActiveRecord::Migration
  def change
    create_table :communes do |t|
      t.string :name, :desc
      t.timestamps
    end
    add_column :interests, :zamieszkania_id, :integer
    add_column :interests, :zameldowania_id, :integer
  end
end
