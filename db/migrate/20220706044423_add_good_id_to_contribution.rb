class AddGoodIdToContribution < ActiveRecord::Migration[6.1]
  def change
    add_column :contributions, :good, :integer, default: 0
  end
end
