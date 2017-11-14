class AddGemsAndReffralNumberToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gems, :integer, default: 0
    add_column :users, :reffer_number, :string, default: ''
  end
end
