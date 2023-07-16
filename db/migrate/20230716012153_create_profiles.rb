class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|

      t.string  :patient,     null: false
      t.date    :barth,       null: false
      t.integer :gender_id,   null: false
      t.string  :blood_type,  null: false
      t.string  :family,      null: false
      t.text    :history,     null: false
      t.text    :disease,     null: false
      t.text    :madications, null: false

      t.integer :user_id,     null: false

      t.timestamps
    end
  end
end
