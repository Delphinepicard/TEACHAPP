class AssignmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[rectorat_index teacher_proposals affect]
  before_action :set_assignment, only: %i[show accept teacher_proposals affect]
  before_action :body_with_background!, only: %i[rectorat_index accept]

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

    @attached_marker = {
      lat: current_user.attached_school.latitude,
      lng: current_user.attached_school.longitude,
      info_window: render_to_string(partial: "shared/school_info_window", locals: { school: current_user.attached_school }),
      image_url: helpers.asset_url('school_icon.png')
    }

    @assign_marker = {
      lat: @assignment.school.latitude,
      lng: @assignment.school.longitude,
      info_window: render_to_string(partial: "shared/school_info_window", locals: { school: @assignment.school }),
      image_url: helpers.asset_url('pin.png')
    }

    @markers = [@attached_marker, @assign_marker]
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

    @match_teachers_attached = @match_teachers_attached.where(specification: @spe_ask) if @school.specification.present?
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
