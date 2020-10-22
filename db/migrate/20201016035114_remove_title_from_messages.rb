class RemoveTitleFromMessages < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :title, :string
  end
end
