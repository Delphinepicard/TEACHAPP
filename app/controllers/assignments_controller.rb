class AssignmentsController < ApplicationController
<<<<<<< mailing
  before_action :set_assignment, only: [:show, :accept]
=======
  before_action :set_assignment, only: [:show, :teacher_proposals]
>>>>>>> master

  def index
    @assignments = Assignment.all
  end

  def show
    @review = Review.new
    @user = current_user
    @classroom = @assignment.classroom
  end

<<<<<<< mailing
  def accept
=======
  def teacher_proposals
    @level_ask = @assignment.classroom.level
    @spe_ask = @assignment.school.specification
    @school = @assignment.school
    @teachers_attached = @school.users_attached

    if @school.specification.present?
      @match_teachers_attached = @teachers_attached.where(level: @level_ask, specification: @spe_ask)
    else
      @match_teachers_attached = @teachers_attached.where(level: @level_ask)
    end
    # @city_ask = @assignment.school.address
    # @teacher_attached = @assignment.user.school_user
>>>>>>> master
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
end
