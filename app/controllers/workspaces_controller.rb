class WorkspacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @workspaces = Workspace.all
  end

  def show
    @workspace = Workspace.find(params[:id])
    @booking = Booking.new
    @unavailable_dates = @workspace.unavailable_dates.to_json
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user = current_user
    if @workspace.save
      # Upload the image to Cloudinary if present
      upload_image_to_cloudinary(@workspace.image) if workspace_params[:image].present?
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
      # Upload the image to Cloudinary if present
      upload_image_to_cloudinary(@workspace.image) if workspace_params[:image].present?
      redirect_to workspace_path(@workspace)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy
    redirect_to owner_workspaces_path
  end

  def my_offerings
    @workspaces = current_user.workspaces
  end

  private

  def workspace_params
    params.require(:workspace).permit(:name, :description, :price, :location, :image)
  end

  def upload_image_to_cloudinary(image)
    begin
      uploaded_image = Cloudinary::Uploader.upload(image)
      uploaded_image['secure_url']
    rescue CloudinaryException => e
      logger.error("Error uploading image to Cloudinary: #{e.message}")
      nil
    end
  end
end
