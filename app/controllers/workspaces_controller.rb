class WorkspacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @workspaces = Workspace.all
  end

  def new
    @workspace = Workspace.new
  end

  def create
    workspace = Workspace.new(workspace_params)
    workspace.save
    redirect_to workspace_path(workspace)
    end

  private

  def workspace_params
    params.require[:workspace].permit(:name, :description, :price, :location)
    end
end
