class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :title
      t.float :amt
      t.string :desc

      t.references :cause, foreign_key: true
      t.timestamps
    end
  end
end
