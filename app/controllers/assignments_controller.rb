class AssignmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[rectorat_index teacher_proposals affect]
  before_action :set_assignment, only: %i[show accept teacher_proposals affect]

  def index
    @assignments = current_user.assignments
    @current_assignment = current_user.assignments.where('start_date <= CURRENT_DATE AND CURRENT_DATE <= end_date').first
  end

  def rectorat_index
    @assignments = Assignment.where(user: nil)
  end

  def show
    @review = Review.new
    @user = current_user
    @classroom = @assignment.classroom
  end

  def accept
  end

  def affect
    @user = User.find(params[:user_id])
    @assignment.update!(user: @user) # sauvegarde en BDD
    UserMailer.accept_assignment(@assignment).deliver_now # envoyer un email
    redirect_to rectorat_assignments_path, notice: "email bien envoyé"
  end

  def teacher_proposals
    @level_ask = @assignment.classroom.level
    @spe_ask = @assignment.school.specification
    @school = @assignment.school
    # A retrouver dans le model school qui correspond aux profs rattaches a l'etablissment de l'affectatiion
    @teachers_attached = @school.users_attached

    filter_teacher_attached

    # Gem Geocoder
    @schools_around = School.near([@school.latitude, @school.longitude], 30)
    # On cree un tableau de profs rattaches aux ecoles aux alentours des 25km
    @teachers_in_schools_around = @schools_around.map(&:users_attached).flatten.uniq

    filter_teacher_around
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def filter_teacher_attached
    @match_teachers_attached = @teachers_attached.where(level: @level_ask).where.not(id: @assignment.classroom.main_teacher.id)
    @match_teachers_attached = @match_teachers_attached.where(pecification: @spe_ask) if @school.specification.present?
  end

  def filter_teacher_around
    @teachers_in_schools_around.reject! { |t| t.id == @assignment.classroom.main_teacher.id } # on ne veux pas proposer le prof absent

    if @school.specification.present?
      @match_teachers_around = @teachers_in_schools_around.select do |t|
        t.level == @level_ask && t.specification == @spe_ask
      end
    else
      @match_teachers_around = @teachers_in_schools_around.select do |t|
        t.level == @level_ask
      end
    end
  end
end
