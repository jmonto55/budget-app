class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
