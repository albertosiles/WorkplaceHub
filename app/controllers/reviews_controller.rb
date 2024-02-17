class ReviewsController < ApplicationController
  def new
    @review = Review.new(review_params)
    @workspace = Workspace.find(params[:workspace_id])
    @review.workspace_id  = @workspace.id
    if @review.save
    redirect_to workspace_path(@workspace)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to workspace_path(@review.workspace_id), status: :see_other
    end

    private

    def review_params
      params.require(:review).permit(:rating, :content)
      end
end
