class AddHoleNumberToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :title, :string
  end
end
