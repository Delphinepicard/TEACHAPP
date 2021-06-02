class UserMailer < ApplicationMailer
  def assignment
    @user = params[:user] # Instance variable => available in view
    @url  = 'http://example.com/login'
    mail(to: @school_user.email, subject: 'Votre affectation')
    # This will render a view in `app/views/user_mailer`!
  end
end
