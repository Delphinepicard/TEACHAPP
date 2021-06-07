class ReviewsController < ApplicationController
  def create
    @classroom = Classroom.find(params[:classroom_id])
    @review = Review.new(review_params)
    @review.classroom = @classroom
    @review.user = current_user
    @assignment = Assignment.find(params[:review][:assignment])
    if @review.save!
      redirect_to assignment_path(@assignment, anchor: "review-#{@review.id}")
    else
      render 'assignments/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
