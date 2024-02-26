class AddCloudinaryImageIdToWorkspaces < ActiveRecord::Migration[7.1]
  def change
    add_column :workspaces, :cloudinary_image_id, :string
  end
end
