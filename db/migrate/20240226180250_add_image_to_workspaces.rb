class AddImageToWorkspaces < ActiveRecord::Migration[7.1]
  def change
    add_column :workspaces, :image, :string
  end
end
