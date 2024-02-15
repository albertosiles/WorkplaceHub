class CreateWorkspaces < ActiveRecord::Migration[7.1]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :location

      t.timestamps
    end
  end
end
