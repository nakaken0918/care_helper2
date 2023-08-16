class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|

      t.string  :patient,     null: false
      t.date    :birth_date,  null: false
      t.integer :gender_id,   null: false
      t.string  :blood_type,  null: false
      t.string  :family,      null: false
      t.text    :history,     null: false
      t.text    :disease,     null: false
      t.text    :medications, null: false

      t.references :user,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
