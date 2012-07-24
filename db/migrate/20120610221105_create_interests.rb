class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :ip
      t.string :email
      t.string :zamieszkanie
      t.string :zameldowanie
      t.timestamps
    end
  end
end
