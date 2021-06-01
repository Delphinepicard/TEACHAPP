class ReviewsController < ApplicationController

  def index
    @reviews = Reviews.where(review.classroom_id=(params[:classroom.id]))
  end

  def create

  end


end
