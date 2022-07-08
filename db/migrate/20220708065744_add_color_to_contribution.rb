class AddColorToContribution < ActiveRecord::Migration[6.1]
  def change
    add_column :contributions , :color, :string, default: "red"
  end
end
