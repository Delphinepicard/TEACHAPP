class UserMailer < ApplicationMailer

  def accept_assignment(assignment)
    @assignment = assignment
    @user = @assignment.user
    mail to: @user.email, subject: "Votre affectation"
    # This will render a view in `app/views/user_mailer`!
  end
end
