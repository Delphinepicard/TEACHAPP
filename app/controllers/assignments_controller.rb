class AssignmentsController < ApplicationController

  before_action :set_assignment, only: [:show, :accept, :teacher_proposals]

  def index
    @assignments = Assignment.all
  end

  def show
    @review = Review.new
    @user = current_user
    @classroom = @assignment.classroom
  end

  def accept
  end

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

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
end
