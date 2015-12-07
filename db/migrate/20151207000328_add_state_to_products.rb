class AddStateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :aasm_state, :string
    add_index :products, :aasm_state
  end
end
