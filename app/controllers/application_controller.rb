class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  private

  def body_with_background!
    @body_with_background = true
  end
end
