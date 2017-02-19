class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :value

      t.references :payment, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :votes, [:user_id, :payment_id], :unique=>true
  end
end
