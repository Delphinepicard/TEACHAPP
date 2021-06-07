class ClassroomController < ApplicationController
  before_action :set_classroom, only: [:show]

  def show

    end
  end

  private

  def set_classroom
    @classroom = Classroom.find(params([:id]))
  end
end
