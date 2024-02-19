class WorkspacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @workspaces = Workspace.all
  end

  def show
    @workspace = Workspace.find(params[:id])
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user = current_user
    if @workspace.save
      redirect_to workspace_path(@workspace)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])
    if @workspace.update(workspace_params)
    redirect_to workspace_path(@workspace)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy
    redirect_to workspaces_path
  end

  private

  def workspace_params
    params.require(:workspace).permit(:name, :description, :price, :location)
  end
end
