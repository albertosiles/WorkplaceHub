class WorkspacesController < ApplicationController
  def index
    @workspaces = Workspace.all
    @workspace = Workspace.new
  end
end
